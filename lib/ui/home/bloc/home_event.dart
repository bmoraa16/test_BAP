part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class CreateInitialLoad extends HomeEvent {}

class GetTaskDetails extends HomeEvent {
  const GetTaskDetails({
    required this.id,
    required this.statusColor,
  });
  final int id;
  final Color statusColor;
}

class DeleteTask extends HomeEvent {
  const DeleteTask({
    required this.id,
  });
  final int id;
}


/*
class TaskAdded extends HomeEvent {
  const TaskAdded({
    required this.pokemonList,
  });
  final List<PokemonList> pokemonList;
}
*/
