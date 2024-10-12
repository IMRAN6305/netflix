import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/app_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/auth/models/signin_req_paramas.dart';

import '../../../service_locator.dart';

import '../models/signup_req_params.dart';

abstract class AuthService {
  Future<Either> SignUp(SignupReqParams params);

  Future<Either> SignIn(SigninReqParams params);
}

class AuthAPiServiceImpl extends AuthService {
  @override
  Future<Either> SignUp(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> SignIn(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      print("Error,${e.response!.data['message']}");
      return Left(e.response!.data['message']);
    }
  }
}
