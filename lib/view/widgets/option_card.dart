import 'package:flutter/material.dart';
import 'package:testapp/util/app_color.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.onTap, required this.optionText});

  final VoidCallback onTap;
  final String optionText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
          optionText,
        ),
      ),
    );
  }
}
