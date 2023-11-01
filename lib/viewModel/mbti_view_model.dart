import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:testapp/model/mbti.dart';
import 'package:testapp/repository/mbti_repository.dart';

class MbtiViewModel extends AutoDisposeAsyncNotifier<List<Mbti>> {
  final MbtiRepository _mbtiRepository;

  MbtiViewModel({required mbtiRepository})
      : _mbtiRepository = GetIt.I.get<MbtiRepository>();

  @override
  FutureOr<List<Mbti>> build() {
    return _mbtiRepository.readMbti();
  }

  //특정 mbti 객체 찾기
  Mbti? findMbti(String mbti) {
    if (state.value != null) {
      return state.value!.where((element) => element.mbti == mbti).first;
    }
    return null;
  }
}

final mbtiProvider =
    AutoDisposeAsyncNotifierProvider<MbtiViewModel, List<Mbti>>(() {
  return GetIt.I.get<MbtiViewModel>();
});
