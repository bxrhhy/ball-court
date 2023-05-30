import 'package:ball_court/styles/text_style.dart';
import 'package:flutter/material.dart';

import 'base_button.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.cancelLabel,
    required this.confirmLabel,
    required this.onCancel,
    required this.onConfirm,
  }) : super(key: key);
  final String title;
  final String content;
  final String cancelLabel;
  final String confirmLabel;
  final Function(bool) onCancel;
  final Function(bool) onConfirm;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: Column(
              children: [
                const SizedBox(height: 12,),
                Text(title,style: titleStyle,),
                const SizedBox(height: 12,),
                Text(content,style: textStyle,),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BaseButton(
                        onTap: (){
                          Navigator.pop(context);
                          onConfirm(true);
                        },
                        text: "知道了"
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
