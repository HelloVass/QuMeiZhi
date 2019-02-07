import 'package:flutter_meizhi/api/dto/MeiZhiResponse.dart';

abstract class ItemVO {}

class SectionVO implements ItemVO {
  final String title;

  SectionVO({this.title});
}

class DailyVO implements ItemVO {
  final MeiZhiResponse wrapper;

  DailyVO({this.wrapper});
}
