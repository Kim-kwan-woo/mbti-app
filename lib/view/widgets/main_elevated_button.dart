import 'package:flutter/material.dart';
import 'package:testapp/util/app_color.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton(
      {super.key, required this.onPressed, required this.childText});

  final VoidCallback onPressed; //onPressed 이벤트
  final String childText; //버튼 텍스트

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        childText,
      ),
    );
  }
}
