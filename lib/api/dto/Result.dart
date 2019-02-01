import 'package:meta/meta.dart';

typedef Mapper<T> = T Function(Map<String, dynamic> json);

class Result<T> {
  bool error;
  List<T> results = [];

  Result.fromJson(
      {@required Map<String, dynamic> json, @required Mapper mapper}) {
    error = json['error'];
    results += json["results"].map((v) => mapper(v)).toList();
  }
}
