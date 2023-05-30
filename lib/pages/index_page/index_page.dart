import 'package:ball_court/pages/court_page/court_page.dart';
import 'package:ball_court/pages/home_page/home_page.dart';
import 'package:ball_court/pages/message_page/message_page.dart';
import 'package:ball_court/pages/profile_page/profile_page.dart';
import 'package:ball_court/pages/welcome_page/welcome_page.dart';
import 'package:ball_court/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../components/publish_dialog.dart';

///配置基础页面
class IndexPage extends ConsumerStatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends ConsumerState<IndexPage> {
  int _currentTab = 0;
  _setCurrentTab(int index){
    if(index==2){

    }else {
      setState(() => _currentTab = index);
    }
  }
  final List<Widget> _pages = const [
    HomePage(),
    CourtPage(),
    SizedBox(),
    MessagePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: _currentTab,
            children: _pages,
          ),
          bottomNavigationBar: Stack(
            alignment: Alignment.center,
            children: [
              BottomNavigationBar(
                onTap: _setCurrentTab,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentTab,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
                unselectedItemColor: const Color(0xffafafaf),
                items: const [
                  BottomNavigationBarItem(icon: Icon(Iconsax.home),label: "首页"),
                  BottomNavigationBarItem(icon: Icon(Iconsax.status),label: "球探"),
                  BottomNavigationBarItem(icon: Text(""),label: ""),
                  BottomNavigationBarItem(icon: Icon(Iconsax.message),label: "消息"),
                  BottomNavigationBarItem(icon: Icon(Iconsax.user),label: "我的"),
                ],
              ),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(context: context, builder: (_)=>const PublishDialog(),);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
                  child: const Icon(Icons.add,color: Colors.white,),
                ),
              )
            ],
          ),
        ),
        Offstage(
          offstage: !ref.watch(flashProvider).showWelcomePage,
          child: const WelcomePage(),
        )
      ],
    );
  }
}
