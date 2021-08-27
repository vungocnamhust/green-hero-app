import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/core/Constant/COLOR_CONST.dart';
import 'package:learning_vietnamese/core/util/url_util.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/Post/post.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/media.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/app_logo/app_logo.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/data_loader.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/widget_loading.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/widget_loading_gif.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/chat_room/controllers/chat_room_controller.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/video/media_object_video.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key key}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ChatRoomController chatRoomController = Get.find();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_CONST.chat_background,
      appBar: AppBar(
        title: Text("${chatRoomController.account.value.name}"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listPostWidget(),
          ],
        ),
      ),
    );
  }

  listPostWidget() {
    return DataLoader<List<Post>>(
        backgroundColor: COLOR_CONST.light_background,
        loadData: () => chatRoomController.getPosts(),
        loadingBuilder: WidgetLoadingGif(
          text: 'Đợi một chút nhé...',
        ),
        builder: (List<Post> data) {
          if (chatRoomController.posts != null)
            log(chatRoomController.posts.elementAt(0).content.toString(),
                name: "ChatRoomScreen");
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 1),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PostWidget(
                  post: chatRoomController.posts.elementAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 40);
              },
              itemCount: chatRoomController.posts != null
                  ? chatRoomController.posts.length
                  : 0);
        });
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({Key key, this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(style: BorderStyle.none),
                color: COLOR_CONST.light_bodyText2,
              ),
              child: Text(
                "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()},${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}",
                style: TextStyle(color: COLOR_CONST.light_background),
              ),
            ),
          ),
          listMediaWidget(),
          ZaloButton(
            title: "Quan tâm tới bài phản ánh này",
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            width: Get.width,
            webUrl: "",
          ),
          ZaloButton(
            title: "Hướng dẫn quy trình phản ánh",
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            width: Get.width,
            webUrl: "",
          ),
          ZaloButton(
            title: "Phản ánh tình trạng xả thải trái phép",
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            width: Get.width,
            webUrl: "http://192.168.1.3:3000/feedback",
          ),
          ZaloButton(
            title: "Bản đồ xả thải công nghiệp",
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            width: Get.width,
            webUrl: "",
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(style: BorderStyle.none),
                color: COLOR_CONST.light_bodyText2,
              ),
              child: Text(
                post.createdAt.hour.toString() +
                    ":" +
                    post.createdAt.hour.toString(),
                style: TextStyle(color: COLOR_CONST.light_background),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  listMediaWidget() {
    List<Widget> mediaListWidget = [];
    if (post.mediaList != null) {
      for (int i = 0; i < post.mediaList.length; i++) {
        var media = post.mediaList.elementAt(i);
        if (media.type == MediaType.IMAGE) {
          mediaListWidget.add(
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: media.url,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => WidgetLoading(),
                  errorWidget: (context, url, error) => AppLogo.small(),
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          );
        } else if (media.type == MediaType.VIDEO) {
          mediaListWidget.add(MediaObjectVideo(
            videoUrl: media.url,
            videoThumbnailUrl: UrlUtil.getVideoThumbnailUrl(),
          ));
        }
      }
    }

    // Content text widget
    mediaListWidget.add(
      Card(
        margin: EdgeInsets.only(top: 0),
        color: COLOR_CONST.light_background,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              Text(
                post.content,
                style: TextStyle(
                    color: COLOR_CONST.light_bodyText3,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
      child: Column(
        children: mediaListWidget,
      ),
    );
  }
}

class ZaloButton extends StatelessWidget {
  const ZaloButton(
      {Key key,
      this.height = 30,
      this.margin,
      this.title,
      this.webUrl,
      this.width = double.infinity})
      : super(key: key);
  final double height;
  final double width;
  final EdgeInsets margin;
  final String title;
  final String webUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: COLOR_CONST.light_bodyText2,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(style: BorderStyle.none),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: COLOR_CONST.light_background,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      onTap: () {
        Get.to(WebView(
          initialUrl: webUrl,
        ));
      },
    );
  }
}
