import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'const.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int rewardValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text('Scratch Your Card'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 1000,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index % 4 == 0 || index % 4 == 3 || index % 4 == 4) {
                rewardValue = 10;
              } else {
                rewardValue = 15;
              }
              scratchDialog(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Image.network(
                    'https://play-lh.googleusercontent.com/qA-pHFA3aulBAf6sxex7XuiOwb5KQMtA_tbmPXy526p9TxIzFIqeabAr8UC3aGDUsng=w240-h480-rw'),
              ),
            ),
          );
        },
      ),
    );
  }

  scratchDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Wrap(
            children: const [
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
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          children: [
            StatefulBuilder(
              builder: (context, StateSetter setState) {
                return Scratcher(
                  accuracy: ScratchAccuracy.low,
                  threshold: 30,
                  brushSize: 40,
                  image: Image.network(
                    'https://play-lh.googleusercontent.com/qA-pHFA3aulBAf6sxex7XuiOwb5KQMtA_tbmPXy526p9TxIzFIqeabAr8UC3aGDUsng=w240-h480-rw',
                  ),
                  child: SizedBox(
                    //color: Colors.amberAccent,
                    height: 180,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Hurray! you won",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${rewardValue} RS/-',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
