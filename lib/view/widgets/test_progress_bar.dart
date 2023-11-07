import 'package:flutter/material.dart';
import 'package:testapp/util/app_color.dart';

class TestProgressBar extends StatefulWidget {
  const TestProgressBar({super.key, required this.questionIdx});

  final int questionIdx; //질문 번호

  @override
  State<TestProgressBar> createState() => _TestProgressBarState();
}

class _TestProgressBarState extends State<TestProgressBar> {
  final GlobalKey _containerKey = GlobalKey(); //컨테이너 키
  Size? size; //프로그레스 바 전체 사이즈

  //프로그레스 바 전체 사이즈 가져오기
  Size? _getSize() {
    if (_containerKey.currentContext != null) {
      final RenderBox renderBox =
          _containerKey.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        size = _getSize();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: _containerKey,
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.grayscale,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          height: 10,
          width: size != null ? ((size!.width / 70) * widget.questionIdx) : 0,
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}
