import 'package:freezed_annotation/freezed_annotation.dart';

part 'mbti.freezed.dart';
part 'mbti.g.dart';

@freezed
class Mbti with _$Mbti {
  factory Mbti({
    required String mbti, //mbti 정보
    required String type, //타입 설명
    required String description, //자세한 설명
  }) = _Mbti;

  factory Mbti.fromJson(Map<String, dynamic> json) => _$MbtiFromJson(json);
}
