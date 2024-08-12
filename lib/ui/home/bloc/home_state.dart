part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoadInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState({
    required this.tasksComplete,
  });
  final List<Tasks> tasksComplete;
}

class HomeTaskLoading extends HomeState {}

class GetTaskSuccess extends HomeState {
  const GetTaskSuccess({
    required this.task,
    required this.statusColor,
  });
  final Task task;
  final Color statusColor;
}

class DeleteTaskSuccess extends HomeState {
  const DeleteTaskSuccess({
    required this.detail,
  });
  final String detail;
}

/*
class TaskAddedState extends HomeState {
  const TaskAddedState({
    required this.pokemonAdded,
  });
  final List<PokemonList> pokemonAdded;
}
*/

class LoadError extends HomeState {
  const LoadError({
    required this.error,
  });
  final String error;
}
