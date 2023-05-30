import 'package:ball_court/components/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class StanderGamePage extends StatefulWidget {
  const StanderGamePage({Key? key}) : super(key: key);

  @override
  State<StanderGamePage> createState() => _StanderGamePageState();
}

class _StanderGamePageState extends State<StanderGamePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, title: "标准5人场"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //A队
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff164AB9),
              ),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Text("A队:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)
                      ],
                    )

                  ],
                ),
              ),
            ),
            //B队
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffB91616),
              ),
            )
          ],
        ),
      ),
    );
  }
}
