import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:testapp/model/mbti.dart';
import 'package:testapp/util/app_color.dart';
import 'package:testapp/util/app_router.dart';
import 'package:testapp/view/widgets/main_elevated_button.dart';
import 'package:testapp/view/widgets/round_custom_painter.dart';
import 'package:testapp/viewModel/mbti_view_model.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key, required this.mbti});
  static const route = '/result';
  final String mbti; //나의 mbti 결과

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mbtiProvider);
    final Mbti? myMbti = ref.watch(mbtiProvider.notifier).findMbti(mbti);

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
                child: myMbti != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            '내 결과는?',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                            myMbti.type.toString(),
                          ),
                          Text(
                            style: const TextStyle(
                              color: AppColor.primary,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                            myMbti.mbti.toString(),
                          ),
                          const SizedBox(height: 36),
                          SvgPicture.asset(
                            'assets/images/result.svg',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 36.0, horizontal: 8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              myMbti.description.toString(),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: MainElevatedButton(
                              childText: '다시 테스트하기',
                              onPressed: () =>
                                  AppRouter().popUntil(context, AppRouter.main),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: MainElevatedButton(
                              childText: '더 많은 MBTI 보러 가기',
                              onPressed: () =>
                                  context.pushNamed(AppRouter.mbti),
                            ),
                          ),
                        ],
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
