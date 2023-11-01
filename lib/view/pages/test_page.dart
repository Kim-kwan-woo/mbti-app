import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/view/widgets/option_card.dart';
import 'package:testapp/view/widgets/test_progress_bar.dart';
import 'package:testapp/viewModel/question_view_model.dart';
import 'package:testapp/viewModel/test_view_model.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});
  static const route = '/test';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testViewModel = ref.watch(testViewProvider);
    final questions = ref.watch(questionsProvider).value;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              TestProgressBar(
                questionIdx: testViewModel,
              ),
              const SizedBox(height: 20),
              Text(
                style: const TextStyle(fontSize: 16),
                '${testViewModel.toString()} / 70',
              ),
              if (questions != null)
                Expanded(
                  child: PageView(
                    controller:
                        ref.read(testViewProvider.notifier).pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: questions
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
                                        e.question.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                OptionCard(
                                  onTap: () => ref
                                      .read(testViewProvider.notifier)
                                      .nextQuestion(context, "a"),
                                  optionText: e.options.first.toString(),
                                ),
                                const SizedBox(height: 15),
                                OptionCard(
                                  onTap: () => ref
                                      .read(testViewProvider.notifier)
                                      .nextQuestion(context, "b"),
                                  optionText: e.options.last.toString(),
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
