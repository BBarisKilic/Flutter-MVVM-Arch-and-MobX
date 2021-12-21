import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mvvm_arch_and_mobx/feature/post/model/post.dart';
import 'package:mobx/mobx.dart';
part 'post_view_model.g.dart';

enum ViewState { normal, loading, success, error }

class PostViewModel = _PostViewModelBase with _$PostViewModel;

abstract class _PostViewModelBase with Store {
  @observable
  List<Post> posts = [];
  @observable
  ViewState viewState = ViewState.normal;

  final url = "https://jsonplaceholder.typicode.com/posts";

  @action
  Future<void> getAllPost() async {
    viewState = ViewState.loading;

    try {
      final response = await Dio().get(url);

      if (response.statusCode == HttpStatus.ok) {
        final responseData = response.data as List;
        posts = responseData.map((e) => Post.fromJson(e)).toList();
        viewState = ViewState.success;
      } else {
        viewState = ViewState.error;
      }
    } catch (e) {
      viewState = ViewState.error;
    }
  }
}
