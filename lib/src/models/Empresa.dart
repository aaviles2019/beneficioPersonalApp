class Empresa {
    int id;
    String nombreEmpresa;
    dynamic imagenEmpresa;
    String calle;
    String numeroInt;
    String numeroExt;
    String alcaldia;
    String codigoPostal;
    String referencia;
    String telefonoContacto;
    String emailContacto;
    String nombreContacto;
    String giro;

    Empresa({
        this.id,
        this.nombreEmpresa,
        this.imagenEmpresa,
        this.calle,
        this.numeroInt,
        this.numeroExt,
        this.alcaldia,
        this.codigoPostal,
        this.referencia,
        this.telefonoContacto,
        this.emailContacto,
        this.nombreContacto,
        this.giro,
    });
    
  @override
  toString() {
    return 'Empresa(id: $id, nombre_empresa: $nombreEmpresa, imagen_empresa: $imagenEmpresa, calle: $calle, numero_int: $numeroInt, numero_ext: $numeroExt, alcaldia: $alcaldia, codigo_postal: $codigoPostal, referencia: $referencia, telefono_contacto:  $telefonoContacto, email_contacto: $emailContacto,  nombre_contacto: $nombreContacto, giro: $giro )';
  }

    factory Empresa.fromJson(Map < String, dynamic > json) {
        return Empresa(id: json["id"],
        nombreEmpresa: json["nombre_empresa"],
        imagenEmpresa: json["imagen_empresa"],
        calle: json["calle"],
        numeroInt: json["numero_int"],
        numeroExt: json["numero_ext"],
        alcaldia: json["alcaldia"],
        codigoPostal: json["codigo_postal"],
        referencia: json["referencia"],
        telefonoContacto: json["telefono_contacto"],
        emailContacto: json["email_contacto"],
        nombreContacto: json["nombre_contacto"],
        giro: json["giro"]);
    }
}

/*class EmpresaRespuesta {
  int page;
  List < Empresa > results;
  int totalPages;
  int totalResults;

  EmpresaRespuesta({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults
  });

  EmpresaRespuesta.fromJson(Map < String, dynamic > json) {
      try {
        page = json['page'];
        if (json['results'] != null) {
          results = <Empresa>[];
        json['results'].forEach((v) {
          results.add(new Empresa.fromJson(v));
        });
      }
      totalPages = json['total_pages'];
      totalResults = json['total_results'];
    } catch (error) {
      print("Error is $error");
    }
  }
}

enum EmpresaType { parques, hoteles, viajes, restaurantes, optica, serviciosMedicos, tiendas, estudios }

extension EmpresaTypeExtension on EmpresaType {
  String get value => toString()
    .split('.')
    .last;
  String get name {
    String name;
    switch (this) {

    case EmpresaType.parques:
      name = "Parques";
      break;
    case EmpresaType.hoteles:
      name = "Hoteles";
      break;
    case EmpresaType.viajes:
      name = "Viajes";
      break;
    case EmpresaType.restaurantes:
      name = "Restaurantes";
      break;
    case EmpresaType.optica:
      name = "Optica";
      break;
    case EmpresaType.serviciosMedicos:
      name = "Servicios Medicos";
      break;
    case EmpresaType.tiendas:
      name = "Tiendas";
      break;
    case EmpresaType.estudios:
      name = "Estudios";
      break;
    }
    return name;
  }
}*/
