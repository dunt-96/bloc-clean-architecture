abstract class LoginRemoteDataSource {
  Future<void> getData();
  Future<void> createData();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<void> getData() async {}

  @override
  Future<void> createData() async {}
}
