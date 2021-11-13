class Giros {
  int id;
  String descripcion;

  Giros({this.id, this.descripcion});

  @override
  toString() {
    return 'Giros(id: $id, descripcion: $descripcion)';
  }

  factory Giros.fromJson(Map<String, dynamic> json) {
    return Giros(id: json['id'], descripcion: json['descripcion']);
  }
}
