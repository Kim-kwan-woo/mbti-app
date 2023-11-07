import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/util/app_router.dart';
import 'package:testapp/view/widgets/main_elevated_button.dart';
import 'package:testapp/view/widgets/mbti_card.dart';
import 'package:testapp/viewModel/mbti_view_model.dart';

class MbtiPage extends ConsumerWidget {
  const MbtiPage({super.key});
  static const route = '/mbti';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mbtiViewModel = ref.watch(mbtiProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    '모든 MBTI',
                  ),
                  MainElevatedButton(
                    childText: '검사하러 가기',
                    onPressed: () =>
                        AppRouter().popUntil(context, AppRouter.main),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: mbtiViewModel.value?.length ?? 0,
                  itemBuilder: (context, index) {
                    return MbtiCard(mbti: mbtiViewModel.value![index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
