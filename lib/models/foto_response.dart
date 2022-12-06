import 'dart:convert';
import 'package:taller_sergio_flutter/models/foto.dart';

class FotosResponse {
  FotosResponse({required this.results});

  List<Foto> results;

  factory FotosResponse.fromJson(String str) =>
      FotosResponse.toList(json.decode(str));

  factory FotosResponse.toList(List<dynamic> fotos) => FotosResponse(
      results: List<Foto>.from(fotos.map((x) => Foto.fromMap(x))));
}
