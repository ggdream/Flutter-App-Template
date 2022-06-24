import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'package:client/global/global.dart';
import 'package:client/tools/toast/toast.dart';

import 'core.dart';
import 'response.dart';
import 'status.dart';

class Net extends GetConnect {
  static Net get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = Global.config.net.baseURL;
    httpClient.timeout = Global.config.net.timeout;
    httpClient.addRequestModifier(_requestModifier);
  }

  Future<T?> httpGet<T>(
    String url, {
    Map<String, dynamic>? query,
    BaseModel? model,
  }) async {
    final response = await get(url, query: query);

    final res = response.bodyString;
    if (response.statusCode == null) {
      Toast.showText('网络异常');
    }
    if (res == null || response.statusCode != 200) return null;

    final mapData = json.decode(res);
    final wrapperModel = WrapperModel.formJson(mapData);
    switch (wrapperModel.code) {
      case Status.success:
        break;
      default:
        Toast.showText(wrapperModel.message);
        return null;
    }

    final bodyData = wrapperModel.data;
    if (bodyData == null) return null;

    if (T is String) {
      return bodyData.toString() as T;
    } else if (T is int || T is double) {
      return bodyData as T;
    } else if (T is Map || T is List) {
      return bodyData as T;
    } else {
      try {
        if (model == null) return bodyData;
        return model.fromJson(bodyData) as T;
      } catch (e) {
        return null;
      }
    }
  }

  Future<T?> httpPost<T>(
    String url,
    Map<String, dynamic> data, {
    BaseModel? model,
  }) async {
    final response = await post(url, data);

    final res = response.bodyString;
    if (response.statusCode == null) {
      Toast.showText('网络异常');
    }
    if (res == null || response.statusCode != 200) return null;

    final mapData = json.decode(res);
    final wrapperModel = WrapperModel.formJson(mapData);
    switch (wrapperModel.code) {
      case Status.success:
        break;
      default:
        Toast.showText(wrapperModel.message);
        return null;
    }

    final bodyData = wrapperModel.data;
    if (bodyData == null) return null;

    if (T is String) {
      return bodyData.toString() as T;
    } else if (T is int || T is double) {
      return bodyData as T;
    } else if (T is Map || T is List) {
      return bodyData as T;
    } else {
      try {
        if (model == null) return bodyData;
        return model.fromJson(bodyData) as T;
      } catch (e) {
        return null;
      }
    }
  }

  Future<Request> _requestModifier(Request request) async {
    final Map<String, String> headers = {};
    request.headers.addAll(headers);

    return request;
  }

  /// 验证码登录，返回token
  Future<AuthTokenModel?> loginByCode(String record, String sms) async {
    return await httpGet<AuthTokenModel>(
      'auth/login/code',
      query: {'record': record, 'sms': sms},
      model: AuthTokenModel(),
    );
  }
}
