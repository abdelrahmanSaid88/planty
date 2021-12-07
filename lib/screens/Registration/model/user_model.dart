class UserModel {
  static const String collectionName='users';
  String? id;
  String? userName;
  String? emailAddress;

  UserModel({this.id, this.userName, this.emailAddress});
  UserModel.fromJson(Map<String, Object?> json)
      :this(
    userName : json['name']! as String,
    emailAddress : json['emailAddress']!as String,
    id : json['id']!as String,
  );


  Map<String, dynamic> toJson() {
    return {
      'name': userName,
      'emailAddress': emailAddress,
      'id': id,
    };
  }
}
