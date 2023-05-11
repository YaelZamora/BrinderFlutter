import 'package:brinder/screens/detail_screen.dart';
import 'package:brinder/screens/new_product_screen.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BRINDER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(1, 60, 60, 60),
      body: Center(
        child: Swiper(
          itemWidth: 300,
          itemHeight: 400,
          itemBuilder: (BuildContext context, int index) => Tarjeta(
            index: index,
          ),
          itemCount: nombres.length,
          layout: SwiperLayout.TINDER,
          onTap: (index) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(
                index: index,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const NewProductScreen(),
          ),
        ),
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Tarjeta extends StatelessWidget {
  const Tarjeta({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final List<String> _nombre = nombres;
    final List<int> _cantidad = cantidades;

    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          SizedBox(
            width: 300,
            height: 400,
            child: Hero(
              tag: index,
              child: const Image(
                image: NetworkImage(
                  'https://tiendaenlinea.casaahued.com/9237-large_default/1409-jarra-2-lts-rojo.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: 75,
            right: 75,
            top: 20,
            child: Hero(
              tag: index + 11,
              child: Text(
                '¡${_nombre.elementAt(index)} invita!',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: MaterialButton(
                minWidth: 150,
                height: 50,
                onPressed: () {},
                child: Hero(
                  tag: index + 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_cantidad.elementAt(index)} Jarras',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<int> cantidades = [
  2,
  3,
  4,
  6,
  3,
  4,
  3,
  2,
  5,
  2,
];

List<String> nombres = [
  'Iván',
  'Eduardo',
  'Aranza',
  'Jimena',
  'Anahí',
  'Rodrigo',
  'Itzel',
  'Marco',
  'Antonio',
  'Alejandra',
];
