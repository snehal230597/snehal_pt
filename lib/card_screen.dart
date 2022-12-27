import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int? rewardValue;
  int? i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text('Scratch Your Card'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 1000000,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
             scratchDialog(context);
            },
            child: Container(
               decoration: BoxDecoration(
                 color: Colors.amberAccent,
                 borderRadius: BorderRadius.circular(5),
               ),
               child: Center(
                 child: Text(
                   "ScratchCard :$index",
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                 ),
               ),
             ),
          );
        },
      ),
    );
  }
}

scratchDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "You Earned Gift",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Divider(
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Scratcher(
              accuracy: ScratchAccuracy.low,
              threshold: 30,
              brushSize: 40,
              image: Image.network(
                'https://cardimpulz.com/wp-content/uploads/2020/01/CardImpulz-Scratch-Card-600x400.jpg',
              ),
              child: Container(
                //color: Colors.amberAccent,
                height: 180,
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hurray! you won",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '10 RS/-',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
