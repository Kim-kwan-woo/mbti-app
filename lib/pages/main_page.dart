import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/pages/test_page.dart';
import 'package:testapp/util/app_color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TestPage(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                  '시작하기',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
