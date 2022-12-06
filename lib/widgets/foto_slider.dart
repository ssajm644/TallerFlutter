import 'package:flutter/material.dart';
import 'package:taller_sergio_flutter/models/models.dart';

class FotoSlider extends StatefulWidget {
  const FotoSlider({super.key, required this.fotos, this.title});

  //* Propiedades de clase
  final List<Foto> fotos;
  final String? title;

  @override
  State<FotoSlider> createState() => _FotoSliderState();
}

class _FotoSliderState extends State<FotoSlider> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    //* El scrollController nos permite crear en el initState un listener
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels >=
    //       scrollController.position.maxScrollExtent - 500) {
    //     widget.onNextPage();
    //   }
    //   print(scrollController.position.pixels);
    //   print(scrollController.position.maxScrollExtent);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, //* para que tome todo el ancho posible
      height: 260,
      child: Column(
        children: [
          if (widget.title != null)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(widget.title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.fotos.length,
              itemBuilder: (context, index) =>
                  _FotoPoster(foto: widget.fotos[index]),
              //fotoId: '${widget.title}-${index}-${widget.fotos[index].id}',
            ),
          )
        ],
      ),
    );
  }
}

//* Poster foto

class _FotoPoster extends StatelessWidget {
  const _FotoPoster({super.key, required this.foto});
  final Foto foto;
  // final String fotoId;
  @override
  Widget build(BuildContext context) {
    //foto.fotoId = fotoId;
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'detail', arguments: foto),
              // child: Hero(
              //   tag: foto.fotoId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), // * ClipRRect nos permite agregar bordes rendondeados
                child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage("${foto.url}.jpg"),
                    width: 130,
                    height: 190,
                    fit: BoxFit.cover),
              )),
          const SizedBox(height: 5),
          Text(
            foto.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
