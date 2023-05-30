import 'package:ball_court/config/routes.dart';
import 'package:ball_court/styles/color_style.dart';
import 'package:flutter/material.dart';

import '../../components/base_app_bar.dart';
import '../../components/base_button.dart';
import 'game_select_item.dart';


class JudgePage extends StatefulWidget {
  const JudgePage({Key? key}) : super(key: key);

  @override
  State<JudgePage> createState() => _JudgePageState();
}

class _JudgePageState extends State<JudgePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //头部
          Stack(
            children: [
              Container(
                height: AppBar().preferredSize.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: gradientColors3,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
                ),
              ),
              baseAppBar(
                context,
                title: "口袋裁判",
              )
            ],
          ),
          const SizedBox(height: 12,),
          //比赛选项
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GameSelectorItem(
                      title: "标准5人场",
                      gameType: GameType.standard_5,
                      desc: "按照NBA的来",
                      icon: "",
                      onTap: (){
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        Navigator.pushNamed(context, Routes.standerGamePage);
                      }
                  ),
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: GameSelectorItem(
                      title: "快速5人场",
                      gameType: GameType.fast_5,
                      desc: "全程无停表",
                      icon: "",
                      onTap: (){

                      }
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GameSelectorItem(
                      title: "快速4人场",
                      gameType: GameType.fast_4,
                      desc: "打满时间或分数",
                      icon: "",
                      onTap: (){

                      }
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: GameSelectorItem(
                      title: "自定义",
                      gameType: GameType.custom,
                      desc: "专属比赛",
                      icon: "",
                      onTap: (){

                      }
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 130,),
        ],
      ),
    );
  }
}
