part of 'add_task_bloc.dart';

enum FormStatus { initial, submitting, success, failure }

class TaskFormState extends Equatable {
  const TaskFormState({
    this.title = '',
    this.isCompleted = false,
    this.dueDate,
    this.comments = '',
    this.description = '',
    this.tags = '',
    this.isFormValid = false,
    this.formStatus = FormStatus.initial,
  });
  final String title;
  final bool isCompleted;
  final DateTime? dueDate;
  final String comments;
  final String description;
  final String tags;
  final bool isFormValid;
  final FormStatus formStatus;

  TaskFormState copyWith({
    String? title,
    bool? isCompleted,
    DateTime? dueDate,
    String? comments,
    String? description,
    String? tags,
    bool? isFormValid,
    FormStatus? formStatus,
  }) {
    return TaskFormState(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      comments: comments ?? this.comments,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      isFormValid: isFormValid ??
          _validateForm(title ?? this.title, isCompleted ?? this.isCompleted),
      formStatus: formStatus ?? this.formStatus,
    );
  }

  static bool _validateForm(String title, bool isCompleted) {
    // ignore: unnecessary_null_comparison
    return title.isNotEmpty && isCompleted != null;
  }

  @override
  List<Object?> get props => [
        title,
        isCompleted,
        dueDate,
        comments,
        description,
        tags,
        isFormValid,
        formStatus,
      ];
}
