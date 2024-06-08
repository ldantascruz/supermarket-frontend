import '../../domain/repository/initial.repository.dart';
import '../datasource/initial.datasource.dart';

class InitialRepositoryImpl extends InitialRepository {
  final InitialDatasource datasource;

  InitialRepositoryImpl(this.datasource);
}
