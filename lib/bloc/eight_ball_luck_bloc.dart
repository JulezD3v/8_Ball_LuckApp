import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'eight_ball_luck_event.dart';
part 'eight_ball_luck_state.dart';

class EightBallBloc extends Bloc<EightBallEvent, EightBallLuckState> {
  EightBallBloc() : super(EightBallLuckInitial()) {
    on<ShakeBall>((event, emit) async {
      emit(EightBallLoading());

      // Simulate a 1-second delay for "suspense"
      await Future.delayed(const Duration(seconds: 1));

      final answers = ["Yes", "No", "Maybe", "Ask Again", "Most Likely"];
      final random = Random();
      int index = random.nextInt(answers.length);

      emit(EightBallLoaded(answers[index], index + 1));
    });
  }
}
