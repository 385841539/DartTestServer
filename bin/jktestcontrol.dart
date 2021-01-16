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

    if ('${request.url}' == 'healthRecords') {
      return json.encode(healthRecords).toString();
    }
    if ('${request.url}' == 'memberMoneyInfo') {
      return json.encode(memberMoneyInfo).toString();
    }

//    return "${request.url}";
    return json.encode(nihao).toString();
  }

  static const Map memberMoneyInfo = {
    "code": 0,
    "message": "success",
    "data": {
      "title": "健康合金家庭卡",
      "subTitle": "立即开通健康卡",
      "money": "¥ 399/年",
      "linkUrl": "https://www.baidu.com"
    }
  };

  static const Map userInfo = {
    "code": 0,
    "message": "success",
    "data": {
      "token": "54323rtnbgfvnbfvdc",
      "name": "小明",
      "age": 42,
      "address": "中国上海",
      "level": "13",
      "headImg":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1297681524,1555435528&fm=26&gp=0.jpg",
      "gender": "male",
      "isJinka": true
    }
  };

  static const Map healthRecords = {
    "code": 0,
    "message": "success",
    "data": {
      "healthRecords": [
        {
          "name": "湖盛琦",
          "age": 42,
          "address": "中国上海",
          "bgColor": "FFFEF3E1",
          "gender": "男",
          "healthUrl": "https://www.baidu.com"
        },
        {
          "name": "常时蓓",
          "age": 52,
          "address": "中国上海",
          "bgColor": "FFE5E2FF",
          "gender": "女",
          "healthUrl": "https://www.baidu.com"
        },
        {
          "name": "植黛燕",
          "age": 2,
          "address": "中国上海",
          "bgColor": "FFD9EFFF",
          "gender": "男",
          "healthUrl": "https://www.baidu.com"
        },
        {
          "name": "时迁",
          "age": 62,
          "address": "中国上海",
          "bgColor": "FF25324A",
          "gender": "男",
          "healthUrl": "https://www.baidu.com"
        }
      ]
    }
  };
}
