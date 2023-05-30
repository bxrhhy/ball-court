import 'package:ball_court/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
        centerTitle: false,
      ),
      body: Center(
        child: Consumer(
          builder: (context,ref,_){
            return Text("${ref.watch(counterProvider).value}");
          },
        )
      ),
    );
  }
}
