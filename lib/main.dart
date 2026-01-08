import 'package:eight_all_luck/widget/shake_anim_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eight_all_luck/widget/ball_area_widget.dart';
import 'package:eight_all_luck/bloc/eight_ball_luck_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
     MaterialApp(
      home: BlocProvider( //for this Error: Could not find the correct Provider<EightBallBloc> above this Magic8BallPage Widget
        create: (_) => EightBallBloc(),
        child: Magic8BallPage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Magic8BallPage extends StatelessWidget {
  const Magic8BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EightBallBloc(),
      child: Center(
        //mainAxisAlignment: MainAxisAlignment.center
        child: Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            title: Text('Magic 8 Ball'),
            titleTextStyle: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            //foregroundColor: Colors.black,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BallArea(), // the ball
                  SizedBox(height: 30),

                  //Users input
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Input your text here",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  //Button
                  GestureDetector(
                    //tomorrows problem still not working,
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<EightBallBloc>().add(ShakeBall());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      child: Text(
                        "SHAKE AGAIN",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
