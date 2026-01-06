part of 'eight_ball_luck_bloc.dart';

@immutable
sealed class EightBallEvent{}

// The action triggered by the user
class ShakeBall extends EightBallEvent{}
