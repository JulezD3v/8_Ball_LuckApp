import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'eight_ball_luck_event.dart';
part 'eight_ball_luck_state.dart';

class EightBallBloc extends Bloc<EightBallEvent, EightBallLuckState> {
  EightBallBloc() : super(EightBallLuckInitial()) {
    on<ShakeBall>((event, emit)
     async {
      emit(EightBallLoading());
//Shacking of the ball and loading will be happening at the same time
      
      await Future.delayed(const Duration(seconds: 1));

      final answers = ["Yes", "No", "Maybe", "Ask Again","Its Certain", "Most Likely", "Very Doubtful", "Not Certain for now"];
//The same ans may come several times(yet to check on it)
      final random = Random();
      int index = random.nextInt(answers.length);

      emit(EightBallLoaded(answers[index], index + 1));// useless, but doesnt harm the codes running
    });
  }
}
