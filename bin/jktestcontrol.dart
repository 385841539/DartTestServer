import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/src/request.dart';

class TestJkControl {
  static String request(Request request) {
    Map nihao = {"name": "小明"};

    print("---request--${request.url}");

    if ('${request.url}' == 'userInfo') {
      return json.encode(userInfo).toString();
    }

//    return "${request.url}";
    return json.encode(nihao).toString();
  }

  static const Map userInfo = {
    "code": 0,
    "message": "success",
    "data": {
      "token": "54323rtnbgfvnbfvdc",
      "name": "小明",
      "age": 42,
      "address": "中国上海",
      "level": "13"
    }
  };
}
