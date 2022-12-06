import 'dart:convert';
import 'package:taller_sergio_flutter/models/foto.dart';

class SearchFotos {
  SearchFotos({
    // required this.info,
    required this.results,
  });

  // Info info;
  List<Foto> results;

  factory SearchFotos.fromJson(String str) =>
      SearchFotos.fromMap(json.decode(str));

  factory SearchFotos.fromMap(Map<String, dynamic> json) => SearchFotos(
        // info: Info.fromMap(json["info"]),
        results: List<Foto>.from(json["results"].map((x) => Foto.fromMap(x))),
      );
}

// class Info {
//     Info({
//         required this.count,
//         required this.pages,
//         required this.next,
//         required this.prev,
//     });

//     int count;
//     int pages;
//     String next;
//     dynamic prev;

//     factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Info.fromMap(Map<String, dynamic> json) => Info(
//         count: json["count"],
//         pages: json["pages"],
//         next: json["next"],
//         prev: json["prev"],
//     );

//     Map<String, dynamic> toMap() => {
//         "count": count,
//         "pages": pages,
//         "next": next,
//         "prev": prev,
//     };
// }

