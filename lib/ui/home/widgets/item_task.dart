import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ItemTaks extends StatelessWidget {
  const ItemTaks({
    super.key,
    required this.assetRoute,
    required this.colorTask,
    required this.title,
    required this.iscompleted,
    required this.date,
    required this.openModal,
  });
  final String assetRoute;
  final Color colorTask;
  final String title;
  final int iscompleted;
  final String date;
  final VoidCallback openModal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpandablePanel(
        header: DecoratedBox(
          decoration: BoxDecoration(
            color: colorTask,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                assetRoute,
                height: 35,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        collapsed: Container(),
        theme: const ExpandableThemeData(
          hasIcon: false,
        ),
        expanded: Container(
          decoration: BoxDecoration(
            color: colorTask.withOpacity(.5),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fecha de vencimiento: $date',
                  softWrap: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: openModal.call,
                    child: const Text(
                      'Mas información',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
