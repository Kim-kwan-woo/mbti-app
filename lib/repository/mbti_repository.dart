import 'package:get_it/get_it.dart';
import 'package:testapp/dataSource/local_mbti_data_source.dart';
import 'package:testapp/model/mbti.dart';

class MbtiRepository {
  final LocalMbtiDataSource _localMbtiDataSource;

  MbtiRepository({required localMbtiDataSource})
      : _localMbtiDataSource = GetIt.I.get<LocalMbtiDataSource>();

  //전체 질문 읽어오기
  Future<List<Mbti>> readMbti() async => await _localMbtiDataSource.readMbti();
}
