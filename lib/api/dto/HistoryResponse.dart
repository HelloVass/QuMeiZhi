class HistoryResponse {
  final String id;
  final String content;
  final String createdAt;
  final String publishedAt;
  final String updatedAt;
  final String randId;
  final String title;

  HistoryResponse(
      {this.id,
      this.content,
      this.createdAt,
      this.publishedAt,
      this.updatedAt,
      this.randId,
      this.title});

  HistoryResponse.fromJson(json)
      : id = json['id'],
        content = json['content'],
        createdAt = json['created_at'],
        publishedAt = json['publishedAt'],
        updatedAt = json['updated_at'],
        randId = json['rand_id'],
        title = json['title'];
}
