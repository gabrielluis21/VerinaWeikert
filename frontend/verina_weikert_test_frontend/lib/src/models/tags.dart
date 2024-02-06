class Tags{
  int? id;
  String? name;

  Tags({
    this.id,
    this.name
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    id: json['id'],
    name: json['name']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name
  };
}