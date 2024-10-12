import 'package:dartz/dartz.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/domain/auth/repository/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../service_locator.dart';
import '../models/signin_req_paramas.dart';
import '../models/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> SignUp(SignupReqParams params) async {
    // return await authApiService.Signup(params);
    var data = await sl<AuthService>().SignUp(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("token", data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<Either> SignIn(SigninReqParams req) async {
    var data = await sl<AuthService>().SignIn(req);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("token", data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
