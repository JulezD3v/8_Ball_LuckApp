import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Shake extends StatefulWidget {
  
  final bool trigger;
  final Widget child;

  const Shake({
    super.key,
    required this.child,
    required this.trigger,
  });

  @override
  State<Shake> createState() => _ShakeState();
}

class _ShakeState extends State<Shake>
    with SingleTickerProviderStateMixin { //allows flutter to controll its animation frames more effectivelly

  late AnimationController _controller; //incharge of start, stop and duration
  late Animation<double> _offset; // directions its going to shake

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,// ties animation to screen refresh , remb asyn 
      duration: const Duration(milliseconds: 400),
    );


//motion
    _offset = TweenSequence<double>([ 
      TweenSequenceItem(tween: Tween(begin: 0, end: -8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8, end: 0), weight: 1),
    ]).animate(_controller);
  }
// runs when the widget gets rebuilt
  @override
  void didUpdateWidget(covariant Shake oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.trigger && !oldWidget.trigger) {
      _controller.forward(from: 0);
    }
  }
// prents memory leecks
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offset,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(_offset.value, 0),
          child: child, // testing what to shake
        );  
      },
      child: widget.child,
    );
  }
}
