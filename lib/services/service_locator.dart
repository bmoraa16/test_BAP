import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_bap/data/network/api/api_client.dart';
import 'package:test_bap/data/network/api/endpoints/delete_task_id_api.dart';
import 'package:test_bap/data/network/api/endpoints/get_task_id_api.dart';
import 'package:test_bap/data/network/api/endpoints/get_tasks_api.dart';
import 'package:test_bap/data/network/api/endpoints/post_tasks_api.dart';
import 'package:test_bap/data/network/api/endpoints/put_task_id_api.dart';
import 'package:test_bap/models/app_config.dart';

class ServiceLocator {
  const ServiceLocator._();

  static final getIt = GetIt.instance;

  static void setupServiceLocator(AppConfig appConfig) {
    getIt
          ..registerSingleton(appConfig)
          // Dio & API Client
          ..registerSingleton(Dio())
          ..registerSingleton(
            ApiClient(getIt<Dio>(), getIt<AppConfig>().apiUrl),
          )

          // API Endpoints methods
          ..registerSingleton(
            GetTasksApi(
              apiClient: getIt<ApiClient>(),
            ),
          )
          ..registerSingleton(
            GetTasksIdApi(
              apiClient: getIt<ApiClient>(),
            ),
          )
          ..registerSingleton(
            PostTasksApi(
              apiClient: getIt<ApiClient>(),
            ),
          )
          ..registerSingleton(
            PutTaskIdApi(
              apiClient: getIt<ApiClient>(),
            ),
          )
          ..registerSingleton(
            DeleteTaskIdApi(
              apiClient: getIt<ApiClient>(),
            ),
          )
/*
      // Remote repositories
      ..registerLazySingleton(
        () => PokemonRepository(getIt<PokemonApi>()),
      )
      ..registerLazySingleton(
        () => PokemonDetailsRepository(getIt<PokemonDetailsApi>()),
      )
      */
        ;
  }
}
