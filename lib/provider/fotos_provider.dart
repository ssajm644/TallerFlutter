import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taller_sergio_flutter/models/foto.dart';
import 'package:taller_sergio_flutter/models/foto_response.dart';
import 'package:taller_sergio_flutter/models/search_fotosxx.dart';

class FotosProvider extends ChangeNotifier {
  final String _baseUrl = 'jsonplaceholder.typicode.com';

  //* Listas
  List<Foto> fotosResults = [];
  // List<Foto> nextFotos = [];
  // int _page = 0;
  // String UrlFoto = '';
  // String UrlNextFoto = '';

  FotosProvider() {
    getFotos();
    //getNextFotos();
  }

  //* argumentos posicionales son obligatorios por defecto por el page lo hicimos opcional app
  //Future<String> _getJsonData(String segmentUrl, [int page = 1]) async {

  Future<String> _getJsonData(String segmentUrl) async {
    //* Construyendo la url de la petición
    final url = Uri.https(_baseUrl, segmentUrl); //, {'page': '$page'});

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return 'Error en la peticion';
    }
    return response.body;
  }

//* https://jsonplaceholder.typicode.com/photos
  getFotos() async {
    final jsonData = await _getJsonData('/photos');
    print(jsonData);
    print(jsonData is String); //* True

    final fotosResponse = FotosResponse.fromJson(jsonData);

    fotosResults = fotosResponse.results;
    //UrlFoto = fotosResponse.url;

    //* les avisa a los widgets que estan escuchando que sucede con la data en caso de cambios y los widgets que estan escuchando se vuelven a renderizar o redibujar
    notifyListeners();
  }
}
//   getNextFotos() async {
//     _page++;
//     final jsonData = await _getJsonData('/photos', _page);
//     final responseNextFotos = FotosResponse.fromJson(jsonData);
//     // nextFotos = responseNextFotos.results;
//     // nextFotos = [...nextFotos, ...responseNextFotos.url];
//     //UrlNextFoto = [];

//     notifyListeners();
//   }

//   //* para realizar la busqueda
//   Future<List<Foto>> searchFotos(String query) async {
//     //* https://rickandmortyapi.com/api/foto?name=rick

//     final url = Uri.https(_baseUrl, "/photos", {'name': query});

//     //* Realizamos la petición
//     final response = await http.get(url);

//     if (response.statusCode != 200) {
//       return [];
//     }
//     //* response.body; //* JSON DE STRING
//     final searchResponse = SearchFotos.fromJson(response.body);
//     return searchResponse.results;
//   }
// }
