part of 'eight_ball_luck_bloc.dart';

class EightBallLuckState{}

final class EightBallLuckInitial extends EightBallLuckState{}

final class EightBallLoading extends EightBallLuckState{}

// The final state with the answer
final class EightBallLoaded extends EightBallLuckState{
  final String answer;
  final int image;// useless havent used any images
  EightBallLoaded(this.answer, this.image);
}
