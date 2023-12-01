class UsersDetail {
  String Uid;
  String DateCreated;
  String Email;
  String Image;
  String username;

  UsersDetail({
    required this.Uid,
    required this.DateCreated,
    required this.Email,
    required this.Image,
    required this.username,
  });
    factory UsersDetail.fromJson(Map<String, dynamic> json) {
    return UsersDetail(
      Uid: json['Uid'],
      DateCreated: json['DateCreated'],
      Email: json['Email'],
      Image: json['Image'],
      username: json['username'],
    );
    
  }
  factory UsersDetail.fromFirestore(Map<String, dynamic> json) {
    return UsersDetail(
      Uid:  json['Uid'],
      DateCreated: json['DateCreated'],
      Email: json['Email'],
      Image: json['Image'],
      username: json['username'], 
    );
  }
   Map<String, dynamic> toJson() =>{
    "uid": Uid,
    "DateCreated": DateCreated,
    "Email": Email,
    "Image": Image,
    "username": username,
   };
}
