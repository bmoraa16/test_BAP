import 'package:flutter/material.dart';
import 'package:test_bap/ui/home/home.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class BasicSuccessDialogWidget extends StatelessWidget {
  const BasicSuccessDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      backgroundColor: ColorConstants.done.withOpacity(.9),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Tarea creada',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Podrás observar la tarea al final de la lista',
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
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
