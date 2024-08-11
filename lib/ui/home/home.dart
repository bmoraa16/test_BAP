import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:test_bap/ui/home/widgets/header_home_screen.dart';
import 'package:test_bap/utils/constants/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
              topLeft: Radius.circular(20), // Esquina superior izquierda
              topRight: Radius.circular(20), // Esquina superior derecha
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderWidget(
                totalTasks: 10,
                completedTasks: 9,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
