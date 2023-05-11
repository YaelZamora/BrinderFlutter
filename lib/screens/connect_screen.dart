import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

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
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(48.85, 2.34),
                zoom: 13,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/yaelzamora/ckwjzugrz2jy115o0so7ipd1c/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieWFlbHphbW9yYSIsImEiOiJja3cydDJ4eWgwZmxmMnFtbmswNHJweGE1In0.AUfal4zjfWtOxr6yR_0ELg',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: latLng.LatLng(48.85, 2.34),
                      builder: (_) => const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Marker(
                      point: latLng.LatLng(48.845, 2.34),
                      builder: (_) => const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Está a 5 minutos de ti',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: MaterialButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Asistencia confirmada'),
                        content: const Text(
                          'Tu anfitrión espera tu llegada, no lo hagas esperar demasiado',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cancel',
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'OK',
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: const Text(
                      'Confirmar asistencia',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
