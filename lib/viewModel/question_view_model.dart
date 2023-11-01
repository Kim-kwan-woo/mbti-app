import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:testapp/model/question.dart';
import 'package:testapp/repository/question_repository.dart';

class QuestionViewModel extends AutoDisposeAsyncNotifier<List<Question>> {
  final QuestionRepository _questionRepository;

  QuestionViewModel({required questionRepository})
      : _questionRepository = GetIt.I.get<QuestionRepository>();

  @override
  FutureOr<List<Question>> build() {
    return _questionRepository.readQuestions();
  }
}

final questionsProvider =
    AutoDisposeAsyncNotifierProvider<QuestionViewModel, List<Question>>(() {
  return GetIt.I.get<QuestionViewModel>();
});
