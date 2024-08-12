import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/models/task.dart';
import 'package:test_bap/ui/home/bloc/home_bloc.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class BasicDialogWidget extends StatelessWidget {
  const BasicDialogWidget({
    required this.task,
    required this.backgroundColor,
    required this.delete,
    super.key,
  });
  final Task task;
  final Color backgroundColor;
  final VoidCallback delete;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      backgroundColor: backgroundColor.withOpacity(.95),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Detalles de la tarea: ${task.title}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.blueGrey,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                '¿Tarea completada?: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                task.isCompleted == 0 ? 'No' : 'Si',
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Fecha de vencimiento: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(task.dueDate),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Comentarios: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(task.dueDate),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Descripción: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(task.description),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Tags: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(task.tags),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Fecha de creación: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(task.createdAt),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Ultima modificación: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(task.updatedAt),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.blueGrey,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.center,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cerrar',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.platinum,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.center,
                ),
                onPressed: delete.call,
                child: Text(
                  'Eliminar\ntarea',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.platinum,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.center,
                ),
                /*
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen(),
                  ),
                ),
                */
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Editar\ntarea',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.platinum,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
      contentPadding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
        left: 20,
        right: 20,
      ),
    );
  }
}
