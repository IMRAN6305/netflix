import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/data/movie/repositorys/movie.dart';
import 'package:netflix/data/movie/sources/movie.dart';

import 'package:netflix/domain/auth/repository/auth.dart';
import 'package:netflix/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';

import 'data/auth/repositorys/auth.dart';
import 'domain/movie/repository/movie.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  //service
  sl.registerSingleton<AuthService>(AuthAPiServiceImpl());
  sl.registerSingleton<MovieService>(MoiveApiService());
  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  //Usercase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
}
