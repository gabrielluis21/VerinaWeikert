import 'package:verina_weikert_test_frontend/src/models/tags.dart';

class Clientes{
  int? id;
  String? email;
  Tags? tag;

  Clientes({
    this.id,
    this.email,
    this.tag,
  });

  factory Clientes.fromJson(Map<String, dynamic> json) => Clientes(
    id: json['id'],
    email: json["email"],
    tag: Tags.fromJson(json["tags"])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "tag": tag?.toJson(),

  };

}