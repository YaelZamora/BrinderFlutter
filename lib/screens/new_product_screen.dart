import 'package:brinder/screens/detail_screen.dart';
import 'package:flutter/material.dart';

const List<String> list = ['Jarras', 'Cubetas', 'Caguama', 'Pisto'];

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  String dropDownValue = list.first;
  List<bool> isSelected = [false, false, false];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.width,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 150,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                value: dropDownValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                dropdownColor: Colors.black,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropDownValue = value!;
                  });
                },
              ),
              ToggleButtons(
                borderColor: Colors.white,
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                    if (isSelected.elementAt(0) == true) {
                      counter--;
                      isSelected[0] = false;
                    } else if (isSelected.elementAt(2) == true) {
                      counter++;
                      isSelected[2] = false;
                    }
                  });
                },
                children: [
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.blue,
                  ),
                  Text(
                    '$counter',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_up_sharp,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: size.width,
            height: 50,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            clipBehavior: Clip.hardEdge,
            child: MaterialButton(
              onPressed: () {},
              minWidth: size.width,
              height: 50,
              child: const Text(
                'Publicar invitación',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
