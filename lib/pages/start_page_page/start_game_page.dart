import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class StartGamePage extends StatelessWidget {
  const StartGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.deepPurple, size: 30),
      ),
    );
  }
}
