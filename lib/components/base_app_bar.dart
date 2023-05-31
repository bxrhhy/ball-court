import 'package:ball_court/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///自定义appbar
baseAppBar(BuildContext context,{String? title,SystemUiOverlayStyle? style,List<Widget>? actions}){
  return AppBar(
    title: Text(title??"",style: titleStyle,),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: style??SystemUiOverlayStyle.dark,
    leading: GestureDetector(
      onTap: ()=>Navigator.pop(context),
      child: const Icon(Icons.keyboard_arrow_left_rounded),
    ),
    actions: actions,
  );
}