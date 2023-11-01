import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testapp/model/mbti.dart';

class LocalMbtiDataSource {
  //전체 질문 읽어오기
  Future<List<Mbti>> readMbti() async {
    String jsonString =
        await rootBundle.loadString('assets/json/mbti_data.json');

    final List<Mbti> mbtiList =
        jsonDecode(jsonString).map<Mbti>((e) => Mbti.fromJson(e)).toList();

    return mbtiList;
  }
}
