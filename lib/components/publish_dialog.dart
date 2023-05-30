import 'package:ball_court/components/bottom_sheet_indicator.dart';
import 'package:ball_court/config/image_path.dart';
import 'package:ball_court/pages/judge_page/judge_page.dart';
import 'package:ball_court/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/routes.dart';
import '../styles/text_style.dart';

class PublishDialog extends StatelessWidget {
  const PublishDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            const BottomSheetIndicator(),
            const SizedBox(
              height: 12,
            ),
            PublishDialogItem(
              title: "发布比赛",
              desc: "免费创建5v5比赛",
              iconPath: startGameSvg,
              onTap: () => Navigator.pushNamed(context, Routes.startGamePage),
            ),
            const SizedBox(
              height: 20,
            ),
            PublishDialogItem(
              title: "球场猎人",
              desc: "发现附近的球场",
              iconPath: gymSvg,
              colors: gradientColors2,
              onTap: () => Navigator.pushNamed(context, Routes.startGamePage),
            ),
            const SizedBox(
              height: 20,
            ),
            PublishDialogItem(
              title: "口袋裁判",
              desc: "便携的计分神器",
              iconPath: countSvg,
              colors: gradientColors3,
              onTap: (){
                showModalBottomSheet(context: context, builder: (_)=>ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: const JudgePage()));
              },
              // onTap: () => Navigator.pushNamed(context, Routes.judgePage),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class PublishDialogItem extends StatelessWidget {
  const PublishDialogItem({
    Key? key,
    required this.title,
    required this.desc,
    required this.onTap,
    required this.iconPath,
    this.colors,
  }) : super(key: key);
  final String title;
  final String desc;
  final VoidCallback onTap;
  final String iconPath;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pop(context);
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: colors ?? gradientColors),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: SvgPicture.asset(
                iconPath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: smallTitleStyle,
                  ),
                  Text(
                    desc,
                    style: descTextStyle,
                  )
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
