import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';

import '../../config/image_path.dart';
import '../../models/player_model.dart';

///添加球员的卡片

class AddPlayerCard extends StatelessWidget {
  const AddPlayerCard({Key? key, required this.player, this.onDelete, this.type}) : super(key: key);
  final Player player;
  final VoidCallback? onDelete;
  final int? type;
  getPng(int? type){if(type == 1){
      return clothPng1;
    }else{
      return clothPng;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              getPng(type),
              height: 120,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularText(
                    children: [
                      TextItem(
                          text: Text(
                            player.name??"",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'zcool',
                                fontWeight:
                                FontWeight
                                    .w800,
                                fontSize: 16),
                          ),
                          space: 25,
                          startAngle: -90,
                          startAngleAlignment:
                          StartAngleAlignment
                              .center)
                    ],
                    radius: 40,
                    position: CircularTextPosition
                        .inside,
                  ),
                  // Text("Joe",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,height: 1),),
                  Text(
                    "${player.num??''}",
                    style: const TextStyle(
                      color: Colors.white,
                        fontWeight:
                        FontWeight.w600,
                        fontSize: 24,
                        height: 1,
                        fontFamily: 'zcool'),
                  )
                ],
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            if(onDelete!=null) {
              onDelete!();
            }
          },
          child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:
                  BorderRadius.circular(4)),
              child: const Text(
                "删除",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
        )
      ],
    );
  }
}
