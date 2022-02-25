class RequestLoginModel {
  String? email;
  String? password;

  RequestLoginModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        'password': password,
      };
}
