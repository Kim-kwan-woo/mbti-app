import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/pages/result_page.dart';
import 'package:testapp/util/app_color.dart';
import 'package:testapp/util/data_source.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});
  final pageController = PageController();
  int currentPage = 0;
  List<int> result = [0, 0, 0, 0];

  //answer가 두 가지 답변 중 위쪽 답변이면 1 아래쪽 답변이면 0
  onTapAnswer(int questionNum, int answer, BuildContext context) {
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
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.grayscale,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                style: TextStyle(fontSize: 16),
                '4 / 70',
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
                              InkWell(
                                onTap: () =>
                                    onTapAnswer(e['index'], 1, context),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: AppColor.subColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 6,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    e['options'].first.toString(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              InkWell(
                                onTap: () =>
                                    onTapAnswer(e['index'], 0, context),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: AppColor.subColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      width: 6,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    e['options'].last.toString(),
                                  ),
                                ),
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
