import 'package:dartz/dartz.dart';

import 'package:netflix/domain/movie/repository/movie.dart';


import '../../../service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnData = await sl<MovieRepository>().getTrendingMovies();
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
