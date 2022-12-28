import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';
import 'package:snehal_pt/card_screen.dart';
import 'const.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


TextEditingController _numberController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {

  final _formKey = GlobalKey<FormState>();
  int rewardValue = 0;
  @override
  Widget build(BuildContext context) {
    // G.D used for control keyboard focus/unfocused....
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
         // backgroundColor: Colors.deepOrange,
          backgroundColor: primaryColor,
          title: const Text('Provider Practice'),
          centerTitle: true,
          actions: [
             Padding(
               padding: const EdgeInsets.only(right: 10),
               child: Icon(Icons.more_vert),
             )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: _numberController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please choose a number";
                    }
                  },
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
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
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     // Navigator.push(context, MaterialPageRoute(builder: (_)=> CardScreen()));
                    }
                  },
                  child: const Text("Try Your LUCK"),
                ),
              ),
              Expanded(
                child: GridView.builder(
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
              )
            ],
          ),
        ),
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

