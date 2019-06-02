class LoginModel {
  final String username;
  final String password;

  LoginModel({this.username, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> parsedJson){
    return LoginModel(
        username: parsedJson['username'],
        password: parsedJson['password']
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
