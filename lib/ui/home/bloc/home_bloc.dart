import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/data/network/repositories/delete_task_repository.dart';
import 'package:test_bap/data/network/repositories/get_task_repository.dart';
import 'package:test_bap/data/network/repositories/get_tasks_repository.dart';
import 'package:test_bap/models/task.dart';
import 'package:test_bap/models/tasks.dart';
import 'package:test_bap/services/service_locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadInitial()) {
    final tasksRepository = ServiceLocator.getIt<TasksRepository>();
    final taskDetailRepository = ServiceLocator.getIt<TaskRepository>();
    final deleteTaskRepository = ServiceLocator.getIt<DeleteTaskRepository>();

    on<CreateInitialLoad>(
      (event, emit) async {
        try {
          emit(
            const HomeLoading(),
          );

          final params = {
            'token': 'Brianprueba',
          };
          final data = await tasksRepository.getTasks(params);

          emit(
            HomeSuccessState(
              tasksComplete: data,
            ),
          );
        } catch (e) {
          emit(
            LoadError(
              error: e.toString(),
            ),
          );
        }
      },
    );

    on<GetTaskDetails>(
      (event, emit) async {
        try {
          emit(
            HomeTaskLoading(),
          );

          final params = {
            'token': 'Brianprueba',
          };
          final data = await taskDetailRepository.getTasks(
            params,
            event.id,
          );

          emit(
            GetTaskSuccess(
              task: data[0],
              statusColor: event.statusColor,
            ),
          );
        } catch (e) {
          emit(
            LoadError(
              error: e.toString(),
            ),
          );
        }
      },
    );

    on<DeleteTask>(
      (event, emit) async {
        try {
          emit(
            HomeTaskLoading(),
          );

          final params = {
            'token': 'Brianprueba',
          };
          final data = await deleteTaskRepository.getTasks(
            params,
            event.id,
          );

          emit(
            DeleteTaskSuccess(
              detail: data.detail,
            ),
          );
        } catch (e) {
          emit(
            LoadError(
              error: e.toString(),
            ),
          );
        }
      },
    );
  }
}
