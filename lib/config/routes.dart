import 'package:ball_court/pages/judge_page/judge_page.dart';
import 'package:ball_court/pages/start_page_page/start_game_page.dart';
import 'package:flutter/material.dart';

import '../pages/stander_game_page/stander_game_page.dart';

//定义页面路由跳转
class Routes{
  static String startGamePage = "startGamePage";
  static String judgePage = "judgePage";
  static String standerGamePage = "standerGame";

  static Map<String, WidgetBuilder> routes() {
    return {
      startGamePage:(context)=>const StartGamePage(),
      judgePage:(context)=>const JudgePage(),
      standerGamePage:(context)=>const StanderGamePage(),
    };
  }
}