import 'package:get_it/get_it.dart';
import 'package:testapp/dataSource/local_question_data_source.dart';
import 'package:testapp/model/question.dart';

class QuestionRepository {
  final LocalQuestionDataSource _localQuestionDataSource;

  QuestionRepository({required localQuestionDataSource})
      : _localQuestionDataSource = GetIt.I.get<LocalQuestionDataSource>();

  //전체 질문 읽어오기
  Future<List<Question>> readQuestions() async =>
      await _localQuestionDataSource.readQuestions();
}
