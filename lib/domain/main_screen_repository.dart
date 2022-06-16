import 'package:coctails/data/coctails_responce/coctails/coctails.dart';
import 'package:coctails/data/remote_data_source.dart';

class MainScreenRepository {
  final RemoteDataSource _remoteDataSource;
  MainScreenRepository(this._remoteDataSource);

  Future<Coctails> getCoctails() async {
    return await _remoteDataSource.getData();
  }
}
