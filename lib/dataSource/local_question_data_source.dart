import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testapp/model/question.dart';

class LocalQuestionDataSource {
  //전체 질문 읽어오기
  readQuestions() async {
    String jsonString =
        await rootBundle.loadString('assets/json/question_data.json');
    final response = Question.fromJson(json.decode(jsonString));
    return response;
  }
}
