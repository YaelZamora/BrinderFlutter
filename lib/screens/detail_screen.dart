import 'package:brinder/screens/connect_screen.dart';
import 'package:brinder/screens/principal_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(1, 60, 60, 60),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: index,
              child: Container(
                width: size.width,
                height: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://tiendaenlinea.casaahued.com/9237-large_default/1409-jarra-2-lts-rojo.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Hero(
              tag: index + 11,
              child: Text(
                '¡${nombres.elementAt(index)} invita!',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: MaterialButton(
                minWidth: size.width,
                height: 50,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ConnectScreen(),
                  ),
                ),
                child: Hero(
                  tag: index + 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${cantidades.elementAt(index)} Jarras',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://picsum.photos/40'),
                ),
                Text(
                  nombres.elementAt(index),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Exercitation ex nisi enim ut adipisicing ea qui proident esse. Cupidatat est sit aliquip aliquip mollit do laborum eiusmod minim. Eiusmod qui veniam proident elit laboris aliquip occaecat ullamco ea laborum. Est culpa enim consectetur aliqua. Incididunt consectetur ex pariatur et ea fugiat deserunt. Id eiusmod mollit est culpa esse ex labore excepteur ullamco reprehenderit ullamco do ullamco reprehenderit. Do sint aute ut pariatur.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
