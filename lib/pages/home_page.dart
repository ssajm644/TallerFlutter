import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_sergio_flutter/provider/fotos_provider.dart';
import 'package:taller_sergio_flutter/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.toString());
    final getFotoProvider = Provider.of<FotosProvider>(context, listen: true);
    // getFotoProvider.nextFotos;
    print(getFotoProvider.fotosResults);
    // getFotoProvider.getNextFotos();
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Text('Usuarios',
                    style: TextStyle(color: Colors.white, fontSize: 23)),
              ),
              ListTile(
                title: const Text('listado de usuarios',
                    style: TextStyle(fontSize: 17)),
                onTap: () {
                  // Navigator.pushNamed(context, 'users');
                },
              ),
              // ListTile(
              //   title: const Text('Item 2'),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
            ],
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Fotos'),
            elevation: 10),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SwiperContainer(fotos: getFotoProvider.fotosResults),
              FotoSlider(
                  fotos: getFotoProvider.fotosResults, title: 'Todas las fotos')
            ],
          ),
        ));
  }
}

//         appBar: AppBar(
//           title: const Text("Fotos"),
//           elevation: 10,
//           // actions: [
//           //   IconButton(
//           //       onPressed: () => showSearch(
//           //           context: context, delegate: FotoSearchDelegate()),
//           //       icon: const Icon(Icons.search_outlined))
//           // ],
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             SwiperContainer(fotos: getFotoProvider.fotosResult),
//             // FotoSlider(
//             //     fotos: getFotoProvider.nextFotos,
//             //     title: 'Personajes',
//             //     onNextPage: () => getFotoProvider.getNextFotos()),
//           ],
//         )));
//   }
// }
