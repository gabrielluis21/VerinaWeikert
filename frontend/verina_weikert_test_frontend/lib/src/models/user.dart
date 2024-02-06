class User{
  int? id;
  String? name;
  String? password;
  String? token;


  User({
    this.id,
    this.name,
    this.password,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['loggedUser']['id'],
    name: json['loggedUser']['name'],
    password: json['loggedUser']['password'],
    token: json['token']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "password": password
  };
}