import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eight_all_luck/widget/ball_area_widget.dart';
import 'package:eight_all_luck/bloc/eight_ball_luck_bloc.dart';

void main() {
  runApp(const MaterialApp(home: Magic8BallPage()));
}

class Magic8BallPage extends StatelessWidget {
  const Magic8BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EightBallBloc(),
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: const Text('Magic 8 Ball'),
          backgroundColor: Colors.blue[900],
          elevation: 0,
        ),
        body: const BallArea(),
      ),
    );
  }
}

