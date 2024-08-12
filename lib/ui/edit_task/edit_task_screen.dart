import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/ui/add_task/bloc/add_task_bloc.dart';
import 'package:test_bap/ui/add_task/widgets/add_task_body.dart';
import 'package:test_bap/ui/edit_task/widgets/edit_task_body.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
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
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => TaskFormBloc(),
          child: EditTaskBodyScreen(
            id: widget.id,
            title: widget.title,
            isCompleted: widget.isCompleted,
            dueDate: widget.dueDate,
            comments: widget.comments,
            description: widget.description,
            tags: widget.tags,
          ),
        ),
      ),
    );
  }
}
