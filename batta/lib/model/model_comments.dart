class CommentsModel {
  final String content, username, writeDate, modifyDate;
  final int boardNum, commentNum;
  late String? profImage;

  CommentsModel.fromJson(Map<String, dynamic> json)
      : commentNum = json['commentNum'],
        boardNum = json['boardNum_id'],
        content = json['content'],
        username = json['username_id'],
        writeDate = json['writeDate'],
        modifyDate = json['modifyDate'],
        profImage = json['profImage'];
}
