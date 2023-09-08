import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/post_list_request.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';
import 'package:payaki/network/repository/post_repository.dart';

import 'package:payaki/network/model/request/post/like_dislike_post_request.dart'
    as post_like_dislike_r;

import 'package:payaki/network/model/request/post/delete_post_request.dart'
    as delete_post;

class MyAdsScreenVm extends ChangeNotifier {
  final PostRepository postRepository = PostRepository();

  List<Data>? myAdsList;
  List<Data>? favouriteAdsList;
  List<Data>? pendingAdsList;
  List<Data>? expiredAdsList;

  bool myAdsListLoading = true;
  bool favouriteAdsListLoading = true;
  bool pendingAdsListLoading = true;
  bool expiredAdsListLoading = true;

  getMyAds({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .getPostList(PostListRequest(
            name: Endpoints.post.getUserPost,
            param: Param(
              listingType: Endpoints.post.allParam,
            )))
        .then((value) {
      myAdsListLoading = false;
      myAdsList = value.data;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      myAdsListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  getFavouriteAds({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .getPostList(PostListRequest(
            name: Endpoints.post.getUserPost,
            param: Param(
              listingType: Endpoints.post.favouriteParam,
            )))
        .then((value) {
      favouriteAdsListLoading = false;
      favouriteAdsList = value.data;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      favouriteAdsListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  getPendingAds({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .getPostList(PostListRequest(
            name: Endpoints.post.getUserPost,
            param: Param(
              listingType: Endpoints.post.pendingParam,
            )))
        .then((value) {
      pendingAdsListLoading = false;
      pendingAdsList = value.data;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      pendingAdsListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  getExpiredAds({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .getPostList(PostListRequest(
            name: Endpoints.post.getUserPost,
            param: Param(
              listingType: Endpoints.post.expireParam,
            )))
        .then((value) {
      expiredAdsListLoading = false;
      expiredAdsList = value.data;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      expiredAdsListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  postLikeDislike({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required String postId,
    required int index,
  }) {
    postRepository
        .postLikeDislike(post_like_dislike_r.LikeDislikePostRequest(
            name: Endpoints.post.likeDislikePost,
            param: post_like_dislike_r.Param(
                userId: Preference().getUserId(), productId: postId)))
        .then((value) {
      if (value.code == 200) {
        favouriteAdsList?.removeAt(index);
        notifyListeners();
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  deletePost({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required String postId,
    required int index,
    required bool isPendingPost,
  }) {
    postRepository
        .deletePost(delete_post.DeletePostRequest(
            name: Endpoints.post.deleteUserPost,
            param: delete_post.Param(productId: postId)))
        .then((value) {
      if (value.code == 200) {
        if (isPendingPost == true) {
          pendingAdsList?.removeAt(index);
        } else {
          myAdsList?.removeAt(index);
        }
        notifyListeners();
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }
}
