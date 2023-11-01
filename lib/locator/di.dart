import 'package:get_it/get_it.dart';
import 'package:testapp/dataSource/local_mbti_data_source.dart';
import 'package:testapp/dataSource/local_question_data_source.dart';
import 'package:testapp/repository/mbti_repository.dart';
import 'package:testapp/repository/question_repository.dart';
import 'package:testapp/viewModel/mbti_view_model.dart';
import 'package:testapp/viewModel/question_view_model.dart';
import 'package:testapp/viewModel/test_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  //Question
  locator.registerLazySingleton(() => LocalQuestionDataSource());
  locator.registerLazySingleton(() => QuestionRepository(
      localQuestionDataSource: locator<LocalQuestionDataSource>()));

  locator.registerFactory(() => QuestionViewModel(
        questionRepository: locator<QuestionRepository>(),
      ));

  //Mbti
  locator.registerLazySingleton(() => LocalMbtiDataSource());
  locator.registerLazySingleton(() =>
      MbtiRepository(localMbtiDataSource: locator<LocalMbtiDataSource>()));

  locator.registerFactory(
      () => MbtiViewModel(mbtiRepository: locator<MbtiRepository>()));

  //Test
  locator.registerFactory(() => TestViewModel());
}
