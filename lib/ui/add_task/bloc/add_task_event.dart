part of 'add_task_bloc.dart';

abstract class TaskFormEvent extends Equatable {
  const TaskFormEvent();

  @override
  List<Object> get props => [];
}

class TitleChanged extends TaskFormEvent {
  const TitleChanged({required this.title});
  final String title;

  @override
  List<Object> get props => [title];
}

class CompletedChanged extends TaskFormEvent {
  const CompletedChanged({required this.isCompleted});
  final bool isCompleted;

  @override
  List<Object> get props => [isCompleted];
}

class DueDateChanged extends TaskFormEvent {
  const DueDateChanged({this.dueDate});
  final DateTime? dueDate;

  @override
  List<Object> get props => [dueDate!];
}

class CommentsChanged extends TaskFormEvent {
  const CommentsChanged({required this.comments});
  final String comments;

  @override
  List<Object> get props => [comments];
}

class DescriptionChanged extends TaskFormEvent {
  const DescriptionChanged({required this.description});
  final String description;

  @override
  List<Object> get props => [description];
}

class TagsChanged extends TaskFormEvent {
  const TagsChanged({required this.tags});
  final String tags;

  @override
  List<Object> get props => [tags];
}

class FormSubmitted extends TaskFormEvent {}

class SubmitForm extends TaskFormEvent {}
