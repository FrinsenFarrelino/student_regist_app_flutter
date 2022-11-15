class User {
  final String itemEmail;
  final String itemNama;

  User({required this.itemEmail, required this.itemNama});

  Map<String, dynamic> toJson() {
    return {"email": itemEmail, "displayName": itemNama};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      itemEmail: json['email'],
      itemNama: json['displayName'],
    );
  }
}
