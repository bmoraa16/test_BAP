import 'package:flutter/material.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          'Brian Octavio\nMora Anaya',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorConstants.lavenderGray,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
