import 'package:flutter/material.dart';
import 'package:testapp/model/mbti.dart';
import 'package:testapp/util/app_color.dart';

class MbtiCard extends StatelessWidget {
  const MbtiCard({super.key, required this.mbti});

  final Mbti mbti; //mbti 정보

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: const BoxDecoration(
        color: AppColor.subColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Column(
        children: [
          Text(
            style: const TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            mbti.mbti,
          ),
          const SizedBox(height: 8),
          Text(
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
            mbti.type,
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            mbti.description,
          ),
        ],
      ),
    );
  }
}
