part of 'edit_task_bloc.dart';

enum FormStatus { initial, submitting, success, failure }

class TaskFormState {
  final int id;
  final String title;
  final int isCompleted;
  final DateTime? dueDate;
  final String comments;
  final String description;
  final String tags;
  final bool isSubmitting;
  final bool isFormValid;
  final FormStatus formStatus;

  TaskFormState({
    this.id = 0,
    this.title = '',
    this.isCompleted = 0,
    this.dueDate,
    this.comments = '',
    this.description = '',
    this.tags = '',
    this.isSubmitting = false,
    this.isFormValid = true,
    this.formStatus = FormStatus.initial,
  });

  TaskFormState copyWith({
    int? id,
    String? title,
    int? isCompleted,
    DateTime? dueDate,
    String? comments,
    String? description,
    String? tags,
    bool? isSubmitting,
    bool? isFormValid,
    FormStatus? formStatus,
  }) {
    return TaskFormState(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      comments: comments ?? this.comments,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isFormValid: isFormValid ?? this.isFormValid,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
