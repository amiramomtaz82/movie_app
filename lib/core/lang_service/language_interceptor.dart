import 'package:dio/dio.dart';
import 'language_control.dart';


class LanguageInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters["language"] = LanguageService.apiLanguage;

    handler.next(options);
  }
}