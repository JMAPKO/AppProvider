class heros {
  final int id;
  final String name;
  final List<String> biografia;
  final String imagen;

  heros({required this.id, required this.name, required this.imagen, required this.biografia});

  factory heros.isfromJson(Map<String, dynamic> json){
    return heros(id: json["id"], name: json["name"], imagen: json["images"]["md"], biografia: json["biography"]);

  }


}