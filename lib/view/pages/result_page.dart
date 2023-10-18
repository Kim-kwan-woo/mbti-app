import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/util/app_color.dart';
import 'package:testapp/view/widgets/main_elevated_button.dart';
import 'package:testapp/view/widgets/round_custom_painter.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.mbti});

  final String mbti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColor.primary,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(top: 100),
            child: CustomPaint(
              painter: RoundCustomPainter(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      '내 결과는?',
                    ),
                    Text(
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                      mbti,
                    ),
                    const SizedBox(height: 36),
                    SvgPicture.asset(
                      'assets/images/result.svg',
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: MainElevatedButton(
                        childText: '다시 테스트하기',
                        onPressed: () => Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
