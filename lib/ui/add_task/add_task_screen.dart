import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/ui/add_task/bloc/add_task_bloc.dart';
import 'package:test_bap/ui/add_task/widgets/add_task_body.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => TaskFormBloc(),
          child: const AddTaskBodyScreen(),
        ),
      ),
    );
  }
}
