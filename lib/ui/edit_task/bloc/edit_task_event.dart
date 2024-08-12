part of 'edit_task_bloc.dart';

abstract class TaskFormEvent {}

class LoadTaskData extends TaskFormEvent {
  LoadTaskData({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.dueDate,
    required this.comments,
    required this.description,
    required this.tags,
  });
  final int id;
  final String title;
  final int isCompleted;
  final DateTime dueDate;
  final String comments;
  final String description;
  final String tags;
}

class SubmitForm extends TaskFormEvent {
  SubmitForm({required this.id});
  final int id;
}

class TitleChanged extends TaskFormEvent {
  TitleChanged({required this.title});
  final String title;
}

class CompletedChanged extends TaskFormEvent {
  CompletedChanged({required this.isCompleted});
  final int isCompleted;
}

class DueDateChanged extends TaskFormEvent {
  DueDateChanged({required this.dueDate});
  final DateTime dueDate;
}

class CommentsChanged extends TaskFormEvent {
  CommentsChanged({required this.comments});
  final String comments;
}

class DescriptionChanged extends TaskFormEvent {
  DescriptionChanged({required this.description});
  final String description;
}

class TagsChanged extends TaskFormEvent {
  TagsChanged({required this.tags});
  final String tags;
}
