import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/endpoints.dart';
import 'package:boilerplate/features/authentication/data/remote/model/request/post_login_request.dart';
import 'package:injectable/injectable.dart';

import 'model/responses/auth_response.dart';

abstract class AuthRemoteDataSources {
  Future<AuthResponse> postLogin(PostLoginRequest request);
}

@LazySingleton(as: AuthRemoteDataSources)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSources {
  final NetworkService networkService;

  const AuthRemoteDataSourceImpl(this.networkService);

  @override
  Future<AuthResponse> postLogin(PostLoginRequest request) async {
    const url = Endpoints.login;
    final response = await networkService.post(url, data: request.toJson());
    return AuthResponse.fromJson(response.data);
  }
}
