import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/app_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class MovieService {
  Future<Either> getTrandingMovies();
}
class MoiveApiService extends MovieService{
  @override
  Future<Either> getTrandingMovies()async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.trandingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

}