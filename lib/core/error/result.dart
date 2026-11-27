import 'failures.dart';

/// Rezultatul unei operații: fie [Success] cu date, fie [Failed] cu o eroare.
/// Repository-urile și use case-urile returnează Result în loc să arunce
/// excepții, astfel stratul Presentation tratează explicit ambele cazuri.
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

class Failed<T> extends Result<T> {
  const Failed(this.failure);
  final Failure failure;
}
