class BoardModel {
  final String boardNum, type, title, content, username, datetime;
  late String? profImage;

  BoardModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        title = json['title'],
        boardNum = json['boardNum'],
        content = json['content'],
        username = json['username'],
        datetime = json['datetime'],
        profImage = json['profImage'];
}
