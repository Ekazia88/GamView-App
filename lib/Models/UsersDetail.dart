class UsersDetail {
  String Uid;
  String DateCreated;
  String Email;
  String imageurl;
  String username;

  UsersDetail({
    required this.Uid,
    required this.DateCreated,
    required this.Email,
    required this.imageurl,
    required this.username,
  });

  factory UsersDetail.fromJson(Map<String, dynamic> json) {
    return UsersDetail(
      Uid: json['Uid'] ?? '', // Use empty string if Uid is null
      DateCreated: json['DateCreated'] ?? '', // Use empty string if DateCreated is null
      Email: json['Email'] ?? '', // Use empty string if Email is null
      imageurl: json['imageurl'] ?? '', // Use empty string if Image is null
      username: json['username'] ?? '', // Use empty string if username is null
    );
  }

  factory UsersDetail.fromFirestore(Map<String, dynamic> json) {
    return UsersDetail(
      Uid: json['Uid'] ?? '', // Use empty string if Uid is null
      DateCreated: json['DateCreated'] ?? '', // Use empty string if DateCreated is null
      Email: json['Email'] ?? '', // Use empty string if Email is null
      imageurl: json['imageurl'] ?? '', // Use empty string if Image is null
      username: json['username'] ?? '', // Use empty string if username is null
    );
  }

  Map<String, dynamic> toJson() => {
    "Uid": Uid,
    "DateCreated": DateCreated,
    "Email": Email,
    "imageurl": imageurl,
    "username": username,
  };
}
