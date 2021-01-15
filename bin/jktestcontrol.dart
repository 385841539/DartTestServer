import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/src/request.dart';

class TestJkControl {
  static String request(Request request) {
    Map nihao = {"name": "小明"};

    print("---request--${request.url}");

//    return "${request.url}";
    return json.encode(nihao).toString();
  }
}
