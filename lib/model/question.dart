import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    required int index,
    required String question,
    required List<String> options,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
