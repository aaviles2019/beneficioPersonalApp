class Promociones {
  int id;
  String titulo;
  String beneficio;
  String observaciones;
  String vigencia;
  int empresa;

  Promociones({
      this.id,
      this.titulo,
      this.beneficio,
      this.observaciones,
      this.vigencia,
      this.empresa
      });

  @override
  toString() {
    return 'Promociones(id: $id, titulo: $titulo, beneficio: $beneficio, observaciones: $observaciones, vigencia: $vigencia, empresa: $empresa)';
  }
   

   factory Promociones.fromJson(Map <String, dynamic> json) {
    return Promociones(id: json["id"],
    titulo: json["titulo"],
    beneficio: json["beneficio"],
    observaciones: json["observaciones"],
    vigencia: json["vigencia"],
    empresa: json["empresa"]);
  }

}
