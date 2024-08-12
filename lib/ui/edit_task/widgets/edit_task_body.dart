import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/ui/common/basic_error_edit_dialog_widget.dart';
import 'package:test_bap/ui/common/basic_success_edit_dialog_widget.dart';
import 'package:test_bap/ui/common/spinner_loading_dialog.dart';
import 'package:test_bap/ui/edit_task/bloc/edit_task_bloc.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class EditTaskBodyScreen extends StatefulWidget {
  const EditTaskBodyScreen({
    super.key,
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

  @override
  State<EditTaskBodyScreen> createState() => _EditTaskBodyScreenState();
}

class _EditTaskBodyScreenState extends State<EditTaskBodyScreen> {
  @override
  void initState() {
    super.initState();

    context.read<TaskFormBloc>().add(
          LoadTaskData(
            id: widget.id,
            title: widget.title,
            isCompleted: widget.isCompleted,
            dueDate: widget.dueDate,
            comments: widget.comments,
            description: widget.description,
            tags: widget.tags,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear nueva Tarea',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorConstants.blueHome,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: ListView(
              children: [
                BlocBuilder<TaskFormBloc, TaskFormState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: widget.title,
                      decoration: InputDecoration(
                        labelText: 'Título de la tarea',
                        labelStyle: TextStyle(
                          color: ColorConstants.inProgress,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstants.inProgress,
                          ),
                        ),
                      ),
                      cursorColor: ColorConstants.inProgress,
                      onChanged: (value) {
                        context
                            .read<TaskFormBloc>()
                            .add(TitleChanged(title: value));
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa un título';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<TaskFormBloc, TaskFormState>(
                  builder: (context, state) {
                    return CheckboxListTile(
                      activeColor: ColorConstants.inProgress,
                      title: Text(
                        '¿Completada?',
                        style: TextStyle(color: ColorConstants.inProgress),
                      ),
                      // ignore: avoid_bool_literals_in_conditional_expressions
                      value: state.isCompleted == 0 ? false : true,
                      onChanged: (value) {
                        context.read<TaskFormBloc>().add(
                              CompletedChanged(
                                isCompleted: value == false ? 0 : 1,
                              ),
                            );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<TaskFormBloc, TaskFormState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Fecha de vencimiento',
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: ColorConstants.inProgress,
                        ),
                        labelStyle: TextStyle(
                          color: ColorConstants.inProgress,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstants.inProgress,
                          ),
                        ),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                        text: state.dueDate != null
                            // ignore: lines_longer_than_80_chars
                            ? "${state.dueDate!.year}-${state.dueDate!.month.toString().padLeft(2, '0')}-${state.dueDate!.day.toString().padLeft(2, '0')}"
                            : '',
                      ),
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null && mounted) {
                          // ignore: use_build_context_synchronously
                          context
                              .read<TaskFormBloc>()
                              .add(DueDateChanged(dueDate: pickedDate));
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<TaskFormBloc, TaskFormState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: widget.comments,
                      decoration: InputDecoration(
                        labelText: 'Comentarios',
                        labelStyle: TextStyle(
                          color: ColorConstants.inProgress,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstants.inProgress,
                          ),
                        ),
                      ),
                      maxLines: 3,
                      onChanged: (value) {
                        context
                            .read<TaskFormBloc>()
                            .add(CommentsChanged(comments: value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<TaskFormBloc, TaskFormState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: widget.description,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        labelStyle: TextStyle(
                          color: ColorConstants.inProgress,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstants.inProgress,
                          ),
                        ),
                      ),
                      maxLines: 3,
                      onChanged: (value) {
                        context
                            .read<TaskFormBloc>()
                            .add(DescriptionChanged(description: value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<TaskFormBloc, TaskFormState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: widget.tags,
                      decoration: InputDecoration(
                        labelText: 'Tags',
                        labelStyle: TextStyle(
                          color: ColorConstants.inProgress,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstants.inProgress,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        context
                            .read<TaskFormBloc>()
                            .add(TagsChanged(tags: value));
                      },
                    );
                  },
                ),
                const SizedBox(height: 32),
                BlocConsumer<TaskFormBloc, TaskFormState>(
                  listener: (context, state) {
                    if (state.formStatus == FormStatus.submitting) {
                      SpinnerDialog.showLoadingSpinner(
                        context,
                        'Cargando',
                      );
                    } else if (state.formStatus == FormStatus.success) {
                      SpinnerDialog.hideSpinner(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const BasicSuccessEditDialogWidget();
                        },
                      );
                    } else if (state.formStatus == FormStatus.failure) {
                      SpinnerDialog.hideSpinner(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const BasicErrorEditDialogWidget();
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isFormValid
                          ? () {
                              context
                                  .read<TaskFormBloc>()
                                  .add(SubmitForm(id: state.id));
                            }
                          : null,
                      child: Text(
                        'Guardar Tarea',
                        style: TextStyle(color: ColorConstants.inProgress),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
