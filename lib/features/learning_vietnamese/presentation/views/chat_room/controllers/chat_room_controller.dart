import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/repositories/post_repository_impl.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/Account/account.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/Post/post.dart';

class ChatRoomController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("Init ChatRoomController");
  }

  final Rx<Account> account = Account().obs;
  RxList<Post> posts = <Post>[].obs;

  void updateChatAccount(Account account) {
    this.account.value = account;
  }

  void addPost(Post post) {
    if (this.posts == null) {
      this.posts.assignAll([]);
    } else {
      this.posts.add(post);
    }
  }

  Future<List<Post>> getPosts() async {
    ApiResponse<List<Post>> response;
    response = await PostRepositoryImpl().getPosts();
    // log(response.result.data.toList().toString(), name: "List Post");
    if (response.hasError) {
      Get.showSnackbar(
        GetBar(
          titleText: Text(
            'Error',
            style: TextStyle(color: Colors.white),
          ),
          message: response.error.message,
          duration: Duration(seconds: 5),
        ),
      );
      return null;
    }
    response.result.data.forEach((element) {
      log(element.content.toString(), name: "ChatRoomController");
    });
    this.posts.assignAll(response.result.data);
    log(this.posts.elementAt(0).mediaList.elementAt(0).type,  name: "ChatRoomController");
    log(this.posts.length.toString(), name: "ChatRoomController");
    log(this.posts.elementAt(0).mediaList.elementAt(0).url.toString(),
        name: "ChatRoomController");
    return response.result.data;
  }
}
