import 'package:flutter/material.dart';

import '../styles/color_style.dart';


class BaseButton extends StatelessWidget {
  const BaseButton({Key? key, required this.text, required this.onTap,this.enable = true, this.color, this.radius}) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool enable;
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(enable){
          onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: enable?(color??Colors.deepPurple):disableColor,
          borderRadius: BorderRadius.circular(radius??8)
        ),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Text(text,style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),),
      ),
    );
  }
}
