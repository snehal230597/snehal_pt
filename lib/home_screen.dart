import 'package:flutter/material.dart';
import 'package:snehal_pt/card_screen.dart';
import 'package:scratcher/scratcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController controller = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int? index;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Provider Practice'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Choose No...",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> CardScreen()));
              },
              child: const Text("Try Your LUCK"),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding:const EdgeInsets.only(left: 12, right: 12, top: 12),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Scratcher(
                  brushSize: 30,
                  threshold: 50,
                  color: Colors.red,
                  image: Image.network(
                      'https://play-lh.googleusercontent.com/qA-pHFA3aulBAf6sxex7XuiOwb5KQMtA_tbmPXy526p9TxIzFIqeabAr8UC3aGDUsng=w240-h480-rw'
                      // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZAcO1bbqBdUGLUutLEHV2m1GfG8XTLLc4Ew&usqp=CAU', ,
                      ),
                  onChange: (value) => print("Scratch progress: $value%"),
                  onThreshold: () => print("Threshold reached, you won!"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
