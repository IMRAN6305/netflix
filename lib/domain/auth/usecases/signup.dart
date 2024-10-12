import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';
import 'package:netflix/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class SignupUsecase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    // return await authRepository.SignUp(params!);
    return await sl<AuthRepository>().SignUp(params!);
  }
}
