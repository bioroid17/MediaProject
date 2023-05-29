class MemberModel {
  // 필수: 아이디, 비번, 닉네임, 주소
  String username;
  String password;
  String nickname;
  String zonecode;
  String address;
  String detailAddress;

  // 선택: 프로필 사진, 전화번호, 이메일
  String? profileImgDir;
  String? phone;
  String? email;

  MemberModel.fromMap(Map<String, dynamic> map)
      : username = map['username'],
        password = map['password'],
        nickname = map['nickname'],
        zonecode = map['zonecode'],
        address = map['address'],
        detailAddress = map['detailAddress'],
        profileImgDir = map['profileImgDir'],
        phone = map['phone'],
        email = map['email'];

  MemberModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        nickname = json['nickname'],
        zonecode = json['zonecode'],
        address = json['address'],
        detailAddress = json['detailAddress'],
        profileImgDir = json['profileImgDir'],
        phone = json['phone'],
        email = json['email'];
}
