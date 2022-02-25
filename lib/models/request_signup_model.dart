class RequestSignupModel {
  String? fName;
  String? lName;
  String? email;
  String? password;
  String? cPassword;

  RequestSignupModel({
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.cPassword,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
