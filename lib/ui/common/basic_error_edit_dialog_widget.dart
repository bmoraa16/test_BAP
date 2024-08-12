import 'package:flutter/material.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class BasicErrorEditDialogWidget extends StatelessWidget {
  const BasicErrorEditDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      backgroundColor: ColorConstants.taskDue.withOpacity(.5),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Error al crear la Tarea',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Intentalo nuevamente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.center,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Aceptar',
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
