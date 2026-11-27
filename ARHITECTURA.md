# Arhitectura aplicației (Clean Architecture + GetX)

Datele vin din serviciul Web REST:

| Ecran           | Metodă | Endpoint                                                      |
|-----------------|--------|---------------------------------------------------------------|
| Home            | GET    | `https://test-api-jlbn.onrender.com/lab2026/v4/feed`          |
| Course Overview | GET    | `https://test-api-jlbn.onrender.com/lab2026/v4/feed/details`  |

## Straturile

```
lib/
├── core/                      # cod comun tuturor straturilor
│   ├── constants/             # URL-ul API-ului, timeout, nr. de reîncercări
│   ├── di/app_binding.dart    # Dependency Injection (leagă straturile)
│   ├── error/                 # Exceptions (Data), Failures + Result (Domain)
│   ├── network/api_client.dart# client HTTP: GET, status code, JSON, retry
│   ├── routes/                # rutele GetX (/home, /course)
│   └── theme/                 # culori
│
├── domain/                    # LOGICA DE BUSINESS – Dart pur, fără Flutter/HTTP
│   ├── entities/              # Feed, CourseDetails, Lesson ...
│   ├── repositories/          # interfața LearningRepository (contract)
│   └── usecases/              # GetFeed, GetCourseDetails
│
├── data/                      # ACCESUL LA DATE
│   ├── models/                # FeedModel, CourseDetailsModel: fromJson / toJson
│   ├── datasources/           # LearningRemoteDataSource (apelează API-ul)
│   └── repositories/          # LearningRepositoryImpl (Exception -> Failure)
│
└── presentation/              # INTERFAȚA
    ├── controllers/           # HomeController, CourseController (GetX)
    ├── bindings/              # ce controller primește fiecare pagină
    ├── state/view_state.dart  # Loading / Content / Error
    ├── pages/                 # HomePage, CoursePage
    └── widgets/               # componente reutilizabile (common/home/course)
```

Regula dependențelor: **Presentation → Domain ← Data**. Domain nu depinde de
nimeni. Data implementează interfața din Domain. Presentation folosește doar
use case-uri, deci nu știe că datele vin prin HTTP.

## Fluxul datelor (Home)

```
HomePage (UI)
  │ 1. se deschide pagina → HomeBinding creează HomeController
  ▼
HomeController.onInit() → loadFeed()
  │ 2. state = LoadingState → UI afișează loader-ul
  ▼
GetFeed (use case)  ──►  LearningRepository (interfață, Domain)
                                │
                                ▼
                    LearningRepositoryImpl (Data)
                                │
                                ▼
                    LearningRemoteDataSourceImpl.getFeed()
                                │
                                ▼
                    ApiClient.getJson('/feed')
                                │ 3. HTTP GET → serverul răspunde cu JSON
                                │    (la 502/503/504 sau timeout reîncearcă)
                                ▼
                    jsonDecode → FeedModel.fromJson()   (deserializare)
                                │
          ◄─────────────────────┘ 4. Repository întoarce Result:
                                      Success(Feed) sau Failed(Failure)
HomeController
  │ 5. Success → state = ContentState(feed)
  │    Failed  → state = ErrorState(mesaj)
  ▼
Obx + StateView → UI se reconstruiește: conținut sau eroare cu „Reîncearcă”
```

Pe Course Overview fluxul este identic, cu `GetCourseDetails` și `/feed/details`.

## Stări și erori

- **Loading**: `LoadingView`. Prima cerere poate dura, pentru că serverul de
  pe Render „doarme” și trebuie să pornească.
- **Error**: `ErrorView` cu mesaj și buton „Reîncearcă”. Mesajele vin din
  `Failure` (fără internet, eroare de server, JSON invalid).
- **Content**: pagina normală. Pe Home, trage în jos pentru reîncărcare
  (pull-to-refresh). Dacă reîncărcarea eșuează, datele vechi rămân pe ecran
  și apare un snackbar.

## Teste

- `test/feed_model_test.dart`: serializarea/deserializarea JSON.
- `test/widget_test.dart`: HomePage cu un repository fals (fără internet),
  ceea ce arată avantajul Clean Architecture: stratul Data se poate înlocui.
