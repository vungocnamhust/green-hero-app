import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/core/Constant/COLOR_CONST.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/chat_room/controllers/chat_room_controller.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/main/controllers/main_controller.dart';
import 'package:learning_vietnamese/router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainController mainController = Get.find();
  final ChatRoomController chatRoomController = Get.find();

  @override
  void initState() {
    super.initState();
    log("Account: ${mainController.accounts.length}", name: "Accounts");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topBarWidget(),
          listChatWidget(),
          tabBarWidget(),
        ],
      ),
    );
  }

  topBarWidget() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        COLOR_CONST.light_primary,
        COLOR_CONST.light_primary_gradient,
      ])),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8, top: 36, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            SearchWidget(),
            Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  listChatWidget() {
    final accountTotal = mainController.accounts.length;
    return accountTotal > 0
        ? Container(
            height: Get.height * 0.79,
            child: SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  scrollDirection: Axis.vertical,
                  itemCount: accountTotal,
                  separatorBuilder: (context, index) {
                    return const Divider(height: 1);
                    // return buildSeparator(index);
                  },
                  itemBuilder: (context, index) {
                    final accountItem =
                        mainController.accounts.elementAt(index);
                    return ListTile(
                      isThreeLine: true,
                      leading: Image.asset('${accountItem.thumbnail}'),
                      title: Text("${accountItem.name.toString()}"),
                      subtitle: Text("${accountItem.lastMsg.toString()}"),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${accountItem.updatedAt.toString()}",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      onTap: () {
                        chatRoomController.updateChatAccount(accountItem);
                        Get.toNamed(RouterLV.CHATROOM);
                      },
                    );
                  }),
            ),
          )
        : Container();
  }

  tabBarWidget() {
    return Flexible(
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 10,
        child: Center(
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
              color: COLOR_CONST.dark_background1,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.message_rounded,
                    size: 25,
                    color: COLOR_CONST.light_primary_gradient,
                  ),
                  Text(
                    "Tin nhắn",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: COLOR_CONST.light_primary_gradient,
                        fontSize: 17),
                  )
                ]),
                Icon(
                  Icons.contact_phone_rounded,
                  size: 30,
                ),
                Icon(
                  Icons.view_headline,
                  size: 40,
                ),
                Icon(
                  Icons.history,
                  size: 30,
                ),
                Icon(
                  Icons.person_outlined,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: 40,
      child: TextField(
        obscureText: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15, right: 15),
          isDense: true,
          labelStyle: TextStyle(
            color: Colors.white60,
            fontSize: 22,
          ),
          border: InputBorder.none,
          labelText: 'Tìm bạn bè, tin nhắn ...',
        ),
        onSubmitted: (text) {},
      ),
    );
  }
}
