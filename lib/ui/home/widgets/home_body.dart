import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/models/tasks.dart';
import 'package:test_bap/ui/common/basic_dialog_widget.dart';
import 'package:test_bap/ui/common/basic_success_delete_dialog_widget.dart';
import 'package:test_bap/ui/common/snack_bar_widget.dart';
import 'package:test_bap/ui/common/spinner_loading_dialog.dart';
import 'package:test_bap/ui/edit_task/bloc/edit_task_bloc.dart';
import 'package:test_bap/ui/edit_task/edit_task_screen.dart';
import 'package:test_bap/ui/home/bloc/home_bloc.dart';
import 'package:test_bap/ui/home/widgets/header_home_screen.dart';
import 'package:test_bap/ui/home/widgets/initial_screen.dart';
import 'package:test_bap/ui/home/widgets/item_task.dart';
import 'package:test_bap/utils/assets/asset_routes.dart';
import 'package:test_bap/utils/constants/color_constants.dart';
import 'package:test_bap/utils/date_validator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Tasks> tasks = [];
  int competedTasks = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoadInitial ||
            state is HomeLoading ||
            state is HomeTaskLoading) {
          SpinnerDialog.showLoadingSpinner(
            context,
            'Cargando',
          );
        } else if (state is LoadError) {
          SpinnerDialog.hideSpinner(context);
          SnackBarWidget.showError(context, state.error, 3);
        } else if (state is GetTaskSuccess) {
          SpinnerDialog.hideSpinner(context);
          final taskData = state.task;

          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return BasicDialogWidget(
                task: taskData,
                backgroundColor: state.statusColor,
                delete: () {
                  context.read<HomeBloc>().add(
                        DeleteTask(
                          id: taskData.id,
                        ),
                      );
                },
                edit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => TaskFormBloc(),
                        child: EditTaskScreen(
                          id: taskData.id,
                          title: taskData.title,
                          isCompleted: taskData.isCompleted,
                          dueDate: DateTime.parse(taskData.dueDate),
                          comments: taskData.comments,
                          description: taskData.description,
                          tags: taskData.tags,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is DeleteTaskSuccess) {
          SpinnerDialog.hideSpinner(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const BasicSuccessDeleteDialogWidget();
            },
          );
        }
        return;
      },
      builder: (context, state) {
        if (state is HomeLoadInitial || state is HomeLoading) {
          return const InitialScreen();
        } else if (state is HomeSuccessState) {
          tasks.addAll(state.tasksComplete);
          if (tasks.isEmpty) {
            if (SpinnerDialog.isOpen(context)) {
              SpinnerDialog.hideSpinner(context);
            }
            return Container(
              height: MediaQuery.of(context).size.height,
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
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderWidget(
                    totalTasks: 1,
                    completedTasks: 0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(child: Text('No hay tareas creadas')),
                ],
              ),
            );
          } else {
            for (var i = 0; i < tasks.length; i++) {
              if (tasks[i].isCompleted == 1) {
                competedTasks++;
              }
            }
            if (SpinnerDialog.isOpen(context)) {
              SpinnerDialog.hideSpinner(context);
            }
          }
        } else if (state is LoadError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(CreateInitialLoad());
                  },
                  icon: const Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(state.error, textAlign: TextAlign.center),
              ],
            ),
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidget(
                totalTasks: tasks.length,
                completedTasks: competedTasks,
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 0,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ItemTaks(
                        assetRoute: tasks[index].isCompleted == 1
                            ? doneIcon
                            : dateValidator(tasks[index].dueDate)
                                ? taskDueIcon
                                : inProgressIcon2,
                        colorTask: tasks[index].isCompleted == 1
                            ? ColorConstants.done
                            : dateValidator(tasks[index].dueDate)
                                ? ColorConstants.taskDue
                                : ColorConstants.inProgress,
                        title: tasks[index].title,
                        iscompleted: tasks[index].isCompleted,
                        date: tasks[index].dueDate,
                        openModal: () {
                          BlocProvider.of<HomeBloc>(context).add(
                            GetTaskDetails(
                              id: tasks[index].id,
                              statusColor: tasks[index].isCompleted == 1
                                  ? ColorConstants.done
                                  : dateValidator(tasks[index].dueDate)
                                      ? ColorConstants.taskDue
                                      : ColorConstants.inProgress,
                            ),
                          );
                          /*
                          */
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool dateValidator(String dueDate) {
    final validator = DateValidator(dueDateString: dueDate);
    return validator.hasDatePassed();
  }
}
