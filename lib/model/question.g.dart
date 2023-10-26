// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      index: json['index'] as int,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'question': instance.question,
      'options': instance.options,
    };
