import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/view/pages/result_page.dart';
import 'package:testapp/util/data_source.dart';
import 'package:testapp/view/widgets/option_card.dart';
import 'package:testapp/view/widgets/test_progress_bar.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final pageController = PageController();

  int currentPage = 0;

  List<int> result = [0, 0, 0, 0];

  int questionIdx = 1;

  //answer가 두 가지 답변 중 위쪽 답변이면 1 아래쪽 답변이면 0
  onTapAnswer(int questionNum, int answer, BuildContext context) {
    questionIdx++;

    switch (questionNum % 7) {
      case 1:
        result[0] += answer;
      case 2 || 3:
        result[1] += answer;
      case 4 || 5:
        result[2] += answer;
      case 6 || 0:
        result[3] += answer;
    }

    if (questionNum == 70) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage(mbti: getMbti()),
        ),
      );
    } else {
      currentPage += 1;
      pageController.jumpToPage(currentPage);
    }

    setState(() {});
  }

  getMbti() {
    String mbti = "";

    if (result[0] > 5) {
      mbti += "E";
    } else {
      mbti += "I";
    }

    if (result[1] > 10) {
      mbti += "S";
    } else {
      mbti += "N";
    }

    if (result[2] > 10) {
      mbti += "T";
    } else {
      mbti += "F";
    }

    if (result[3] > 10) {
      mbti += "J";
    } else {
      mbti += "P";
    }

    return mbti;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              TestProgressBar(
                questionIdx: questionIdx,
              ),
              const SizedBox(height: 20),
              Text(
                style: const TextStyle(fontSize: 16),
                '${questionIdx.toString()} / 70',
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: DataSource.questions
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/person.svg',
                                    ),
                                    const SizedBox(height: 28),
                                    Text(
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      e['question'].toString(),
                                    ),
                                  ],
                                ),
                              ),
                              OptionCard(
                                onTap: () =>
                                    onTapAnswer(e['index'], 1, context),
                                optionText: e['options'].first.toString(),
                              ),
                              const SizedBox(height: 15),
                              OptionCard(
                                onTap: () =>
                                    onTapAnswer(e['index'], 0, context),
                                optionText: e['options'].last.toString(),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
