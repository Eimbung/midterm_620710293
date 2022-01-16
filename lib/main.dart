import 'package:flutter/material.dart';
import 'package:midterm_620710293/Wcal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  var weghtCal = WeightCalcualte();

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      "PIG WEIGHT",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent),
                    ),
                  ),
                  Center(
                    child: Text(
                      "CALCULATOR",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/pig.png'),
                    width: 250,
                    height: 200,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("LENGTH",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("(cm)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      width: 20,
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _controller,
                                        decoration:
                                            InputDecoration(hintText: "ENTER LENGTH"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("GIRTH",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("(cm)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      width: 20,
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _controller2,
                                        decoration:
                                            InputDecoration(hintText: "ENTER GIRTH "),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'CALCULATE',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          onPressed: () {
                            var length = double.tryParse(_controller.text);
                            var girth = double.tryParse(_controller2.text);
                            if (length == null || girth == null) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('ERROR'),
                                    content: Text("Invalid input"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              var weight = weghtCal.calculateWeight(
                                  length / 100, girth / 100);
                              var btmWeight = weight - 3;
                              var upperWeight = weight + 3;
                              var btmPrice = (btmWeight * 112.50).round();
                              var upperPrice = (upperWeight * 112.50).round();

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('RESULT'),
                                    content: Text(
                                        "Weight: $btmWeight - $upperWeight kg\nPrice: $btmPrice - $upperPrice Baht"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
