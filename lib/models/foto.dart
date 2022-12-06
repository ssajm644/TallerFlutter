import 'dart:convert';

class Foto {
  Foto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  //! Este id lo utilizamos para las animaciones con el widget Hero(), es lo que va ir en el tag
  //String? fotoId;

  factory Foto.fromJson(String str) => Foto.fromMap(json.decode(str));
  factory Foto.fromMap(Map<String, dynamic> json) => Foto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}

// class Location {
//   Location({
//     required this.name,
//     required this.url,
//   });

//   String name;
//   String url;

//   factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Location.fromMap(Map<String, dynamic> json) => Location(
//         name: json["name"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toMap() => {
//         "name": name,
//         "url": url,
//       };
// }
