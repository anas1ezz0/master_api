import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:masterapi/cubit/my_cubit.dart';
import 'package:masterapi/my_repo.dart';
import 'package:masterapi/service/web_service.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt
      .registerLazySingleton<WebService>(() => WebService(createAndSetUpDio()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio = Dio();
  Duration timeOut = const Duration(seconds: 200);
  dio
    ..options.connectTimeout = timeOut
    ..options.receiveTimeout = timeOut;

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
  ));
  return dio;
}
// class DioFactory {
//   /// private constructor as I don't want to allow creating an instance of this class
//   DioFactory._();

//   static Dio? dio;

//   static Dio getDio() {
//     Duration timeOut = const Duration(seconds: 30);

//     if (dio == null) {
//       dio = Dio();
//       dio!
//         ..options.connectTimeout = timeOut
//         ..options.receiveTimeout = timeOut;
  
//       return dio!;
//     } else {
//       return dio!;
//     }
//   }

  
// }
