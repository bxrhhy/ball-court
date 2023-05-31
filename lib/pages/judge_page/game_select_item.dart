import 'package:flutter/material.dart';

enum GameType { standard_5, fast_5, fast_4, fast_3, fast_1, custom }

class GameSelectorItem extends StatelessWidget {
  const GameSelectorItem(
      {Key? key,
      required this.title,
      required this.desc,
      required this.icon,
      required this.onTap,
      required this.gameType})
      : super(key: key);
  final String title;
  final String desc;
  final String icon;
  final VoidCallback onTap;
  final GameType gameType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    colors: _getBackgroundColor(),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft
                ),
            )
          ),
          Positioned(
            right: 12,
            top: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24,fontWeight: FontWeight.w800,color: Colors.white),
                ),
                Text(
                  desc,
                  style: TextStyle(
                      fontSize: 12,color: Colors.white.withOpacity(0.6),fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // const Positioned(
          //     bottom: 12,
          //     child: Row(
          //       children: [
          //         Text('创建比赛',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),),
          //         Icon(Icons.keyboard_arrow_right_rounded,color: Colors.white,)
          //       ],
          //     ))
        ],
      ),
    );
  }

  List<Color> _getBackgroundColor() {
    switch (gameType) {
      case GameType.standard_5:
        return const [
          Color(0xff353C54),
          Color(0xff646D98),
        ];
      case GameType.fast_5:
        return const [
          Color(0xff7A519E),
          Color(0xffC9ADE2),
        ];
      case GameType.fast_4:
        return const [
          Color(0xff87526E),
          Color(0xffEFB6D4),

        ];
      case GameType.fast_3:
        return [];
      case GameType.fast_1:
        return [];
      default:
        return const [
          Color(0xff58498A),
          Color(0xffCABDF5),
        ];
    }
  }
}
