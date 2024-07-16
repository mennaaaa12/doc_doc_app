import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newapp/Core/networking/api_service.dart';
import 'package:newapp/Core/networking/dio_factory.dart';
import 'package:newapp/Features/login/data/repos/login_repo.dart';
import 'package:newapp/Features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}