typedef Mapper<T> = T Function(Map<String, dynamic> json);

class Result<T> {
  bool error;
  List<T> results = [];

  Result.fromJson({Map<String, dynamic> json, Mapper mapper}) {
    error = json['error'];
    results += json["results"].map((v) => mapper(v)).toList();
  }
}
