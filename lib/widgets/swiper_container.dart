import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:taller_sergio_flutter/models/foto.dart';
import 'package:taller_sergio_flutter/models/models.dart';

class SwiperContainer extends StatelessWidget {
  const SwiperContainer({super.key, required this.fotos});
  final List<Foto> fotos;

  @override
  Widget build(BuildContext context) {
    //* Obteniendo las dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    //* 1000 * 0.5 = ?? 500
    //* Si la información aun no esta disponible ( a los personajes)

    if (fotos.isEmpty) {
      return SizedBox(
          width: double.infinity, //* va tomar todo el ancho disponible
          height: size.height * 0.5,
          child: const Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: fotos.length, //* la cantidad de cards
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.77,
        itemHeight: size.height * 0.42,
        itemBuilder: (context, index) {
          final foto = fotos[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage("${foto.url}.jpg"),
                fit: BoxFit.fill),
          );
        },
      ),
    );
  }
}
