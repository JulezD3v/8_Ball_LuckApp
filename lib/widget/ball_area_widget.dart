import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eight_all_luck/bloc/eight_ball_luck_bloc.dart';

class BallArea extends StatelessWidget {
  const BallArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<EightBallBloc, EightBallLuckState>(
        builder: (context, state) {
          // Default values
          String message = "Tap the ball to begin";
          int imgNum = 1; // Default starting image

          if (state is EightBallLoading) {
            return const CircularProgressIndicator(color: Colors.white);
          }

          if (state is EightBallLoaded) {
            message = state.answer;
            imgNum = state.imageNumber;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => context.read<EightBallBloc>().add(ShakeBall()),
                child: Image.asset(
                  'assets/ball$imgNum.png', // Ensure you have ball1.png to ball5.png
                  width: 250,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}