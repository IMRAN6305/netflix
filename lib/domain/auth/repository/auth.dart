import 'package:dartz/dartz.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';

import '../../../data/auth/models/signin_req_paramas.dart';

abstract class AuthRepository{
    Future<Either> SignUp(SignupReqParams req);
    Future<Either> SignIn(SigninReqParams req);
    Future<bool> isLoggedIn();
}