import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/data/network/repositories/add_tasks_repository.dart';
import 'package:test_bap/services/service_locator.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class TaskFormBloc extends Bloc<TaskFormEvent, TaskFormState> {
  TaskFormBloc() : super(const TaskFormState()) {
    on<TitleChanged>(_onTitleChanged);
    on<CompletedChanged>(_onCompletedChanged);
    on<DueDateChanged>(_onDueDateChanged);
    on<CommentsChanged>(_onCommentsChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<TagsChanged>(_onTagsChanged);
    on<SubmitForm>(_onSubmitForm);
  }

  void _onTitleChanged(TitleChanged event, Emitter<TaskFormState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onCompletedChanged(
    CompletedChanged event,
    Emitter<TaskFormState> emit,
  ) {
    emit(state.copyWith(isCompleted: event.isCompleted));
  }

  void _onDueDateChanged(DueDateChanged event, Emitter<TaskFormState> emit) {
    emit(state.copyWith(dueDate: event.dueDate));
  }

  void _onCommentsChanged(CommentsChanged event, Emitter<TaskFormState> emit) {
    emit(state.copyWith(comments: event.comments));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<TaskFormState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onTagsChanged(TagsChanged event, Emitter<TaskFormState> emit) {
    emit(state.copyWith(tags: event.tags));
  }

  Future<void> _onSubmitForm(
    SubmitForm event,
    Emitter<TaskFormState> emit,
  ) async {
    try {
      emit(state.copyWith(formStatus: FormStatus.submitting));

      String? formattedDueDate;
      if (state.dueDate != null) {
        formattedDueDate =
            // ignore: lines_longer_than_80_chars
            "${state.dueDate!.year}-${state.dueDate!.month.toString().padLeft(2, '0')}-${state.dueDate!.day.toString().padLeft(2, '0')}";
      }
      final addTaskRepository = ServiceLocator.getIt<AddTasksRepository>();
      final params = {
        'token': 'Brianprueba',
        'title': state.title,
        'is_completed': state.isCompleted == true ? '1' : '0',
        'due_date': formattedDueDate,
        'comments': state.comments,
        'description': state.description,
        'tags': state.tags,
      };

      // ignore: unused_local_variable
      final data = await addTaskRepository.postTask(params);

      emit(state.copyWith(formStatus: FormStatus.success));
    } catch (_) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }
}
