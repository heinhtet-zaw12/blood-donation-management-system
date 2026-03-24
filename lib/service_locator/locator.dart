import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<void> setUpLocator() async{
  final getIt = GetIt.I;
  Dio dio = Dio();
  dio.options.baseUrl = UrlConst.baseUrl;
  dio.interceptors.add(PrettyDioLogger());
  getIt.registerSingleton<Dio>(dio);
  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  getIt.registerSingleton(AppStorage());
  Dio authDio = Dio();
  authDio.options.baseUrl = UrlConst.baseUrl;
  authDio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );
  authDio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, interceptor) async {
        AppStorage storage = getIt.get<AppStorage>();
        options.headers['Authorization'] = 'Bearer ${await storage.getToken()}';
        interceptor.next(options);
      },
    ),
  );
  getIt.registerSingleton(authDio, instanceName: 'auth');
}