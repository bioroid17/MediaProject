class BoardModel {
  final String boardNum, boardType, title, content, username, datetime;
  late String? profImage;

  BoardModel.fromJson(Map<String, dynamic> json)
      : boardType = json['boardType'],
        title = json['title'],
        boardNum = json['boardNum'],
        content = json['content'],
        username = json['username'],
        datetime = json['datetime'],
        profImage = json['profImage'];
}
