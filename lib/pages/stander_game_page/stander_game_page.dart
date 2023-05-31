import 'package:ball_court/components/base_app_bar.dart';
import 'package:ball_court/components/base_button.dart';
import 'package:ball_court/components/base_dialog.dart';
import 'package:ball_court/pages/stander_game_page/add_player_card.dart';
import 'package:ball_court/pages/stander_game_page/player_simple_input_dialog.dart';
import 'package:ball_court/styles/color_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../models/player_model.dart';

class StanderGamePage extends StatefulWidget {
  const StanderGamePage({Key? key}) : super(key: key);

  @override
  State<StanderGamePage> createState() => _StanderGamePageState();
}

class _StanderGamePageState extends State<StanderGamePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Player> homeList = [];
  List<Player> visitList = [];
  TextEditingController teamNameController = TextEditingController();
  TextEditingController teamNameController2 = TextEditingController();

  //添加主队球员
  addHomePlayer(Player player) {
    for (var i in homeList) {
      if (i.num == player.num) {
        EasyLoading.showToast("${player.num}号已存在,请勿重复添加");
        return;
      }
    }
    homeList.add(player);
    setState(() {});
  }
  //添加客队球员
  addVisitPlayer(Player player) {
    for (var i in visitList) {
      if (i.num == player.num) {
        EasyLoading.showToast("${player.num}号已存在,请勿重复添加");
        return;
      }
    }
    visitList.add(player);
    setState(() {});
  }

  //删除球员
  removePlayer(Player player) {
    showCupertinoDialog(
        context: context,
        builder: (_) => BaseDialog(
            title: "提示",
            content: "删除后需重新添加",
            cancelLabel: "取消",
            confirmLabel: "删除",
            onConfirm: () {
              homeList.removeAt(homeList.indexOf(player));
              setState(() {});
            }));

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: baseAppBar(context, title: "标准5人场",actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(EvaIcons.info_outline,color: Colors.black,)),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: gradientColors2
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          "主队:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                    height: 44,
                                    child: TextField(
                                      controller: teamNameController,
                                      onChanged: (_) => setState(() {}),
                                      style: const TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w600),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 0),
                                        hintText: "点击输入球队名称",
                                        hintStyle: TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey),
                                      ),
                                    ),
                                  )),
                              if (teamNameController.text.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    teamNameController.clear();
                                    setState(() {});
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: const Icon(
                                        Iconsax.close_circle,
                                        color: Colors.grey,
                                      )),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //添加球员
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "添加球员:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            constraints:
                            const BoxConstraints(minWidth: 500, minHeight: 145),
                            child: Row(
                              children: [
                                Row(
                                  children: homeList
                                      .map((e) => AddPlayerCard(
                                    type: 0,
                                    player: e,
                                    onDelete: () {
                                      removePlayer(e);
                                    },
                                  ))
                                      .toList(),
                                ),
                                //添加按钮
                                if (homeList.length < 12)
                                  GestureDetector(
                                    onTap: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (_) => PlayerSimpleInputDialog(
                                            onConfirm: addHomePlayer),
                                      );
                                    },
                                    child: Container(
                                        padding:
                                        const EdgeInsets.only(top: 12, left: 12),
                                        child: const Icon(
                                          Iconsax.add_circle,
                                          color: Color(0xff164ab9),
                                        )),
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("V",style: TextStyle(fontSize: 30,fontFamily: 'zcool',color: Colors.blue),),
                    Text("S",style: TextStyle(fontSize: 30,fontFamily: 'zcool',color: Colors.redAccent),),
                  ],
                ),
              ),
              //客队
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: gradientColors3
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          "客队:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                    height: 44,
                                    child: TextField(
                                      controller: teamNameController2,
                                      onChanged: (_) => setState(() {}),
                                      style: const TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w600),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 0),
                                        hintText: "点击输入球队名称",
                                        hintStyle: TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey),
                                      ),
                                    ),
                                  )),
                              if (teamNameController2.text.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    teamNameController2.clear();
                                    setState(() {});
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: const Icon(
                                        Iconsax.close_circle,
                                        color: Colors.grey,
                                      )),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //添加球员
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "添加球员:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            constraints:
                            const BoxConstraints(minWidth: 500, minHeight: 145),
                            child: Row(
                              children: [
                                Row(
                                  children: visitList
                                      .map((e) => AddPlayerCard(
                                    type: 1,
                                    player: e,
                                    onDelete: () {
                                      removePlayer(e);
                                    },
                                  ))
                                      .toList(),
                                ),
                                //添加按钮
                                if (visitList.length < 12)
                                  GestureDetector(
                                    onTap: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (_) => PlayerSimpleInputDialog(
                                            onConfirm: addVisitPlayer),
                                      );
                                    },
                                    child: Container(
                                        padding:
                                        const EdgeInsets.only(top: 12, left: 12),
                                        child: const Icon(
                                          Iconsax.add_circle,
                                          color: Color(0xff164ab9),
                                        )),
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          child: SizedBox(
            height: 45+MediaQuery.of(context).padding.bottom,
            child: BaseButton(
              onTap: (){
                if(teamNameController.text.isEmpty){
                  EasyLoading.showToast("请输入主队名称");
                  return;
                }else if(teamNameController2.text.isEmpty){
                  EasyLoading.showToast("请输入客队名称");
                  return;
                }else if(homeList.length<5){
                  EasyLoading.showToast("主队球员不足5人,无法开始比赛");
                  return;
                }else if(visitList.length<5){
                  EasyLoading.showToast("客队球员不足5人,无法开始比赛");
                  return;
                }
              },
              text: "下一步",
            ),
          ),
        ),
      ),
    );
  }
}
