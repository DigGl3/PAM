import '../../core/error/result.dart';
import '../entities/feed.dart';
import '../repositories/learning_repository.dart';

/// Use case: obține datele pentru ecranul Home.
class GetFeed {
  const GetFeed(this._repository);

  final LearningRepository _repository;

  Future<Result<Feed>> call() => _repository.getFeed();
}
