import 'dart:convert';

FastAnswer fastAnswerFromJson(String str) =>
    FastAnswer.fromJson(json.decode(str));

String fastAnswerToJson(FastAnswer data) => json.encode(data.toJson());

class FastAnswer {
  FastAnswer({
    required this.id,
    required this.nombre,
    required this.respuesta,
  });

  final String id;
  final String nombre;
  final String respuesta;

  factory FastAnswer.fromJson(Map<String, dynamic> json) => FastAnswer(
        id: json["id"] ?? '',
        nombre: json["nombre"] ?? '',
        respuesta: json["respuesta"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "respuesta": respuesta,
      };
}
