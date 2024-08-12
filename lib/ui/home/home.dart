import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bap/ui/home/bloc/home_bloc.dart';
import 'package:test_bap/ui/home/widgets/home_body.dart';

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
        body: BlocProvider(
          create: (context) => HomeBloc()
            ..add(
              CreateInitialLoad(),
            ),
          child: const Scaffold(
            body: HomeBody(),
          ),
        ),
      ),
    );
  }
}
