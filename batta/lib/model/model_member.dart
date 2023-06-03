class MemberModel {
  // 필수: 아이디, 비번, 닉네임, 주소
  String username;
  String password;
  String nickname;
  String zonecode;
  String address;

  // 선택: 프로필 사진, 전화번호, 이메일
  String? image;
  String phone;
  String email;

  MemberModel.fromMap(Map<String, dynamic> map)
      : username = map['username'],
        password = map['password'],
        nickname = map['nickname'],
        zonecode = map['zonecode'],
        address = map['address'],
        image = map['image'],
        phone = map['phone'],
        email = map['email'];

  MemberModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        nickname = json['nickname'],
        zonecode = json['zonecode'],
        address = json['address'],
        image = json['image'],
        phone = json['phone'],
        email = json['email'];
}
