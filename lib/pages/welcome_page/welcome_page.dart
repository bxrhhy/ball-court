import 'dart:async';

import 'package:ball_court/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  int count = 5;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //隐藏状态栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (count == 1) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        timer = null;
        t.cancel();
        ref.read(flashProvider).closeWelcomePage();
      } else {
        count--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/images/ad_1.png",fit: BoxFit.fitWidth),
          ),
          Positioned(
              right: 16,
              top: 0,
              child: SafeArea(
                child: Consumer(
            builder: (context, ref, _) => GestureDetector(
                onTap: () {
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                  ref.read(flashProvider).closeWelcomePage();
                  timer?.cancel();
                  timer = null;
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text("跳过(${count}s)"),
                ),
            ),
          ),
              ))
        ],
      ),
    );
  }
}
