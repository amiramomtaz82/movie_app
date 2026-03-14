


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/utilis/app_constant.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GetItModule {


  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;


  @singleton
  Connectivity createConnectivity() => Connectivity();

  @singleton
  Dio createDio() {
    var dio = Dio(
        BaseOptions(baseUrl:"https://movies-api.accel.li/api/v2/")///should add my own
    );
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return dio;

    // interceptor print any api request or response
  }
}

