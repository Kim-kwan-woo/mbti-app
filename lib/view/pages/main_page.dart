import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:testapp/util/app_router.dart';
import 'package:testapp/util/app_color.dart';
import 'package:testapp/view/widgets/main_elevated_button.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            SvgPicture.asset(
              'assets/images/avatar.svg',
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                children: [
                  TextSpan(text: "당신의 "),
                  TextSpan(
                    text: "MBTI",
                    style: TextStyle(color: AppColor.primary),
                  ),
                  TextSpan(text: "는?"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
              '내 엠비티아이는 뭘까?\n간단한 테스트를 통해 알아보자!',
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: MainElevatedButton(
                childText: '시작하기',
                onPressed: () => context.pushNamed(AppRouter.test),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: MainElevatedButton(
                childText: 'MBTI 백과사전',
                onPressed: () => context.pushNamed(AppRouter.mbti),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
