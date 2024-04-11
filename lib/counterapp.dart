import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _Page_3State();
}

class _Page_3State extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Counter app',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 253, 240, 255)),
                ),
                backgroundColor: Color.fromARGB(255, 238, 141, 255),
                elevation: 10,
              ),
              body: Center(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value.number.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 125, 23, 143),
                            fontSize: 50,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    final counter = context.read<Counter>();
                                    counter.increment();
                                  },
                                  child: Row(
                                    children: [
                                      Text('Increment'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: TextField(
                                            controller:
                                                value.incrementcontroller,
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            textAlignVertical: TextAlignVertical
                                                .center, // Align text vertically to center

                                            style: TextStyle(fontSize: 15),
                                            decoration: InputDecoration(
                                                hintText: '#',
                                                hintStyle:
                                                    TextStyle(fontSize: 15),
                                                contentPadding: EdgeInsets.only(
                                                    bottom: 10)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    final counter = context.read<Counter>();
                                    counter.decrement();
                                  },
                                  child: Row(
                                    children: [
                                      Text('Decrement'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: TextField(
                                            controller:
                                                value.decrementcontroller,
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            textAlignVertical: TextAlignVertical
                                                .center, // Align text vertically to center

                                            style: TextStyle(fontSize: 15),
                                            decoration: InputDecoration(
                                                hintText: '#',
                                                hintStyle:
                                                    TextStyle(fontSize: 15),
                                                contentPadding: EdgeInsets.only(
                                                    bottom: 10)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                final counter = context.read<Counter>();
                                counter.reset();
                                print('reset');
                              },
                              child: Text('Reset')),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final counter = context.read<Counter>();
                              counter.toggleText();
                            },
                            child: Text(
                                'Want to go below 0? ${value.buttonText()}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Color.fromARGB(255, 238, 141, 255),
            ));
  }
}

class Counter extends ChangeNotifier {
  double number = 0;
  increment() {
    if (incrementcontroller.text.trim().isEmpty) {
      number++;
    } else {
      number += double.parse(incrementcontroller.text);
    }
    notifyListeners();
  }

  TextEditingController incrementcontroller = TextEditingController();
  TextEditingController decrementcontroller = TextEditingController();

  // decrement() {
  //   setState(() {
  //     if (toggleText() == false) {
  //       if (number <= 0) {
  //         number = 0;
  //       }
  //       number--;
  //     } else if (toggleText() == true) {
  //       number--;
  //     }
  //   });
  // }
  decrement() {
    if (decrementcontroller.text.trim().isEmpty) {
      if (yesorno) {
        number--;
      } else {
        if (number > 0) {
          number--;
        }
      }
    } else {
      if (yesorno) {
        // If yes, allow decrementing below 0
        number -= double.parse(decrementcontroller.text);
      } else {
        // If no, prevent decrementing below 0
        if (number > 0) {
          number--;
        }
      }
    }

    notifyListeners();
  }
//
  // goNegative() {
  //   if (toggleText() == false) {
  //     zero();
  //   }
  // }

  zero() {
    if (number <= 0) {
      number = 0;
    }
    notifyListeners();
  }

//
  reset() {
    number = 0;
    notifyListeners();
  }

  bool yesorno = true;
  String buttonText() {
    return yesorno == true ? 'Yes' : 'No';
  }

  toggleText() {
    yesorno = !yesorno;
    notifyListeners();
  }
}
