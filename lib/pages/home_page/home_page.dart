import 'package:ball_court/components/base_dialog.dart';
import 'package:ball_court/pages/profile_page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ElevatedButton(
                  onPressed: () {
                    // ref.read(counterProvider).increment();
                    showCupertinoDialog(
                        context: context,
                        builder: (_) => BaseDialog(
                            title: "提示",
                            content: "即将退出",
                            cancelLabel: "取消",
                            confirmLabel: "确认",
                            onCancel: (value) {},
                            onConfirm: (value) {}));
                  },
                  child: Text("+1"));
            },
          ),
          ElevatedButton(
              onPressed: () {
                EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
                EasyLoading.instance.backgroundColor = Colors.white;
                EasyLoading.show(
                    indicator: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.deepPurple, size: 30),dismissOnTap: true);
              },
              child: Text("JUMP"))
        ],
      )),
    );
  }
}
