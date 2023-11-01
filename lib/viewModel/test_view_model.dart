import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:testapp/model/question.dart';
import 'package:testapp/util/app_router.dart';

class TestViewModel extends StateNotifier<int> {
  TestViewModel() : super(1);

  PageController pageController = PageController(); //테스트 페이지 페이지 컨트롤러
  List<Question> questions = []; //질문 리스트
  List<List<String>> answers =
      List.generate(10, (_) => List.generate(7, (_) => '')); //답변

  //다음 질문 이동 이벤트
  nextQuestion(BuildContext context, String answer) {
    recordAnswer((state - 1) ~/ 7, (state - 1) % 7, answer);

    if (state < 70) {
      pageController.jumpToPage(state);
      state++;
    } else {
      String mbti = getMyMbti();
      context.pushNamed(AppRouter.result, extra: mbti);
    }
  }

  //답변 기록
  recordAnswer(int row, int col, String answer) {
    answers[row][col] = answer;
  }

  //mbti 결과 분석
  getMyMbti() {
    Map<String, int?> mbtiScores = {
      'eScore': 0,
      'iScore': 0,
      'sScore': 0,
      'nScore': 0,
      'tScore': 0,
      'fScore': 0,
      'jScore': 0,
      'pScore': 0,
    };

    String ei, sn, tf, jp;

    for (int i = 0; i < answers.length; i++) {
      for (int j = 0; j < answers[i].length; j++) {
        if (answers[i][j] == "a") {
          switch (j % 7) {
            case 0:
              mbtiScores['eScore'] = mbtiScores['eScore']! + 1;
            case 1 || 2:
              mbtiScores['sScore'] = mbtiScores['sScore']! + 1;
            case 3 || 4:
              mbtiScores['tScore'] = mbtiScores['tScore']! + 1;
            case 5 || 6:
              mbtiScores['jScore'] = mbtiScores['jScore']! + 1;
          }
        } else {
          switch (j % 7) {
            case 0:
              mbtiScores['iScore'] = mbtiScores['iScore']! + 1;
            case 1 || 2:
              mbtiScores['nScore'] = mbtiScores['nScore']! + 1;
            case 3 || 4:
              mbtiScores['fScore'] = mbtiScores['fScore']! + 1;
            case 5 || 6:
              mbtiScores['pScore'] = mbtiScores['pScore']! + 1;
          }
        }
      }
    }

    ei = (mbtiScores['eScore']! > mbtiScores['iScore']!) ? 'E' : 'I';
    sn = (mbtiScores['sScore']! > mbtiScores['nScore']!) ? 'S' : 'N';
    tf = (mbtiScores['tScore']! > mbtiScores['fScore']!) ? 'T' : 'F';
    jp = (mbtiScores['jScore']! > mbtiScores['pScore']!) ? 'J' : 'P';

    return ei + sn + tf + jp;
  }
}

final testViewProvider =
    StateNotifierProvider.autoDispose<TestViewModel, int>((ref) {
  return GetIt.I.get<TestViewModel>();
});
