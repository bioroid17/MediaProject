class CommentsModel {
  final String boardNum, commentNum, content, username, datetime;
  late String? profImage;

  CommentsModel.fromJson(Map<String, dynamic> json)
      : commentNum = json['commentNum'],
        boardNum = json['boardNum'],
        content = json['content'],
        username = json['username'],
        datetime = json['datetime'],
        profImage = json['profImage'];
}
