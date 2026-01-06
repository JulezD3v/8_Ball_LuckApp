import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eight_all_luck/bloc/eight_ball_luck_bloc.dart';
import 'package:eight_all_luck/widget/shake_anim_widget.dart'; // will make the magic8ball shake

class BallArea extends StatelessWidget {
  const BallArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<EightBallBloc, EightBallLuckState>(
        builder: (context, state) {
          // Default values
          String message = "Tap the ball to begin";
          // if (state is EightBallLoading) {
          //   return Shake(
          //     trigger: true);
          // }

          if (state is EightBallLoaded) {
            message = state.answer;
          }

          return Column(
            mainAxisSize: MainAxisSize.min, // For it to fit
            
            children: [
              Shake(
                trigger: state is EightBallLoading,
                child: GestureDetector(
                  onTap: () => context.read<EightBallBloc>().add(ShakeBall()),
                
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.shade700),
                      
                        child: Center(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}