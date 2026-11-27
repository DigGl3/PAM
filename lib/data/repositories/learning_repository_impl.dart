import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/error/result.dart';
import '../../domain/entities/course_details.dart';
import '../../domain/entities/feed.dart';
import '../../domain/repositories/learning_repository.dart';
import '../datasources/learning_remote_data_source.dart';

/// Implementarea repository-ului: cere datele de la data source și
/// transformă excepțiile tehnice în Failure-uri înțelese de Domain.
class LearningRepositoryImpl implements LearningRepository {
  const LearningRepositoryImpl(this._remote);

  final LearningRemoteDataSource _remote;

  @override
  Future<Result<Feed>> getFeed() => _guard(_remote.getFeed);

  @override
  Future<Result<CourseDetails>> getCourseDetails() =>
      _guard(_remote.getCourseDetails);

  Future<Result<T>> _guard<T>(Future<T> Function() request) async {
    try {
      return Success(await request());
    } on ServerException catch (e) {
      return Failed(ServerFailure(
        'Serverul a răspuns cu eroarea ${e.statusCode}. Încearcă din nou.',
        statusCode: e.statusCode,
      ));
    } on NetworkException {
      return Failed(const NetworkFailure(
        'Nu s-a putut contacta serverul. Verifică conexiunea la internet.',
      ));
    } on ParsingException {
      return Failed(const ParsingFailure(
        'Datele primite de la server nu au formatul așteptat.',
      ));
    } catch (e) {
      return Failed(UnexpectedFailure('A apărut o eroare neașteptată: $e'));
    }
  }
}
