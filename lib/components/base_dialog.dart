import 'package:ball_court/styles/text_style.dart';
import 'package:flutter/material.dart';

import 'base_button.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    required this.title,
    required this.content,
     this.cancelLabel,
    required this.confirmLabel,
     this.onCancel,
    required this.onConfirm,
  }) : super(key: key);
  final String title;
  final String content;
  final String? cancelLabel;
  final String confirmLabel;
  final Function? onCancel;
  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 64),
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    if(cancelLabel!=null)
                      Expanded(
                        child: BaseButton(
                          color: Colors.grey,
                            onTap: (){
                              Navigator.pop(context);
                              if(onCancel!=null){
                                onCancel!();
                              }
                            },
                            text: cancelLabel!
                        ),
                      ),
                    if(cancelLabel!=null)
                    const SizedBox(width: 12,),
                      Expanded(
                      child: BaseButton(
                        onTap: (){
                          Navigator.pop(context);
                          onConfirm();
                        },
                        text: confirmLabel??"知道了"
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
