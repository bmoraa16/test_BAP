import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:test_bap/utils/assets/asset_routes.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });
  final int completedTasks;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Image.asset(userIcon),
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Brian Mora",
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Progreso'),
                    Expanded(
                      child: LinearPercentIndicator(
                        animation: true,
                        barRadius: const Radius.circular(5),
                        lineHeight: 8,
                        percent: completedTasks / totalTasks,
                        progressColor: Colors.blue,
                      ),
                    ),
                    Text('$completedTasks/$totalTasks'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.transparent,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}