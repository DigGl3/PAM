// Date de test, cu aceeași structură ca răspunsurile API-ului.

const feedJson = <String, dynamic>{
  'header': {
    'greeting': 'Hi, Kristin',
    'subtitle': 'Let’s start learning',
    'avatarUrl': '',
    'notification': {'hasUnread': true, 'iconUrl': ''},
  },
  'learnedToday': {
    'title': 'Learned today',
    'learnedMinutes': 46,
    'goalMinutes': 60,
    'formatted': '46min / 60min',
    'progress': 0.7667,
  },
  'myCourses': {'title': 'My courses', 'actionLabel': 'My courses'},
  'learningPrompt': {
    'title': 'What do you want to learn today?',
    'actionLabel': 'Get Started',
    'imageUrl': '',
  },
  'learningPlan': {
    'title': 'Learning Plan',
    'items': [
      {
        'id': 'packaging-design',
        'title': 'Packaging Design',
        'completed': 40,
        'total': 48,
        'progress': 0.8333,
        'progressIconUrl': '',
      },
      {
        'id': 'product-design',
        'title': 'Product Design',
        'completed': 6,
        'total': 24,
        'progress': 0.25,
        'progressIconUrl': '',
      },
    ],
  },
  'meetup': {
    'title': 'Meetup',
    'subtitle': 'Off-line exchange of learning experience',
    'imageUrl': '',
  },
};

const detailsJson = <String, dynamic>{
  'navigation': {'title': 'Course Overview', 'backIconUrl': ''},
  'course': {
    'id': 'react-front-to-back',
    'title': 'React Front To back',
    'duration': '6h 30min',
    'durationMinutes': 390,
    'lessonCount': 7,
    'rating': 4.9,
    'hero': {
      'label': 'SPOKEN ENGLISH',
      'imageUrl': '',
      'playIconUrl': '',
      'videoCount': 75,
      'classCount': 35,
    },
    'tabs': {
      'selected': 'lessons',
      'items': [
        {'id': 'lessons', 'label': 'Lessons', 'selected': true},
        {'id': 'description', 'label': 'Description', 'selected': false},
      ],
    },
    'lessons': [
      {
        'id': 'lesson-1',
        'title': 'Introduction to React',
        'duration': '04:28',
        'durationSeconds': 268,
        'completed': false,
        'locked': false,
        'playIconUrl': '',
        'arrowIconUrl': '',
      },
      {
        'id': 'lesson-4',
        'title': 'Build React',
        'duration': '26:18',
        'durationSeconds': 1578,
        'completed': false,
        'locked': true,
        'playIconUrl': '',
        'arrowIconUrl': '',
      },
    ],
    'description': {'text': ''},
  },
  'actions': {
    'price': {'label': 'Free', 'amount': 0, 'currency': 'USD'},
    'enroll': {'label': 'Enroll Now', 'enabled': true},
  },
  'uiIcons': {
    'durationIconUrl': '',
    'lessonsIconUrl': '',
    'ratingIconUrl': '',
  },
};
