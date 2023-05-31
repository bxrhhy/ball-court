import 'package:ball_court/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../components/base_button.dart';

///简单的球员信息输入框
class PlayerSimpleInputDialog extends StatefulWidget {
  const PlayerSimpleInputDialog({Key? key, required this.onConfirm, }) : super(key: key);
  final Function(Player) onConfirm;

  @override
  State<PlayerSimpleInputDialog> createState() => _PlayerSimpleInputDialogState();
}

class _PlayerSimpleInputDialogState extends State<PlayerSimpleInputDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Text("球员信息",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                      const SizedBox(height: 20,),
                      Container(
                        height: 46,
                        // width: 150,
                        decoration: BoxDecoration(
                            color: const Color(0xffefefef),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextField(
                          controller: nameController,
                          maxLength: 12,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              counter: Text(""),
                              contentPadding: EdgeInsets.only(left: 12),
                              hintText: "输入球员姓名"
                          ),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Container(
                        height: 46,
                        // width: 150,
                        decoration: BoxDecoration(
                            color: const Color(0xffefefef),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextField(
                          controller: numController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 12),
                              hintText: "输入球员号码"
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: BaseButton(
                              color: Colors.grey,
                              onTap: (){
                                Navigator.pop(context);
                                nameController.clear();
                                numController.clear();
                              },
                              text: "取消",
                            ),
                          ),
                          const SizedBox(width: 12,),
                          SizedBox(
                            width: 150,
                            child: BaseButton(
                              onTap: (){
                                if(nameController.text.isEmpty){
                                  EasyLoading.showToast("姓名不能为空");
                                  return;
                                } else if(numController.text.isEmpty){
                                  EasyLoading.showToast("号码不能为空");
                                  return;
                                }
                                Navigator.pop(context);
                                widget.onConfirm(Player(
                                    userId: "",
                                    name: nameController.text,
                                    num: int.parse(numController.text)
                                ));
                                nameController.clear();
                                numController.clear();
                              },
                              text: "添加",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
