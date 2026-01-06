part of 'eight_ball_luck_bloc.dart';

@immutable
sealed class EightBallLuckState{}

final class EightBallLuckInitial extends EightBallLuckState{}

// Shown while the "ball" is thinking
final class EightBallLoading extends EightBallLuckState{}

// The final state with the answer
final class EightBallLoaded extends EightBallLuckState{
  final String answer;
  final int imageNumber; // 1 to 5 to match your assets

  EightBallLoaded(this.answer, this.imageNumber);
}
