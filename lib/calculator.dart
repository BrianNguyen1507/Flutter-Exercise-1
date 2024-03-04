import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Calculator> {
  final TextEditingController _resultValue = TextEditingController();

  List<String> buttons = <String>[
    'M+',
    'M-',
    'MC',
    'AC',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black,
        title: const Text(
          "Simple Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$display ",
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextField(
                          textAlign: TextAlign.right,
                          controller: _resultValue,
                          enabled: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero),
                                  borderSide: BorderSide.none)),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
              height: 200,
              child: GridView.count(
                mainAxisSpacing: 6,
                crossAxisCount: 4,
                crossAxisSpacing: 6,
                children: List.generate(buttons.length, (index) {
                  return Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (buttons[index] == 'AC') {
                          text = '0';
                          res = '';
                          numOne = 0;
                          numTwo = 0;
                          display = '';
                          result = '';
                          finalResult = '0';
                          op = '';
                          preOp = '';
                        } else if (op == '=' && buttons[index] == '=') {
                          if (preOp == '+') {
                            finalResult = add();
                          } else if (preOp == '-') {
                            finalResult = sub();
                          } else if (preOp == 'x') {
                            finalResult = mul();
                          } else if (preOp == '/') {
                            finalResult = div();
                          }
                        } else if (buttons[index] == '+' ||
                            buttons[index] == '-' ||
                            buttons[index] == 'x' ||
                            buttons[index] == '/') {
                          cal = buttons[index];
                          if (result.isNotEmpty) {
                            numOne = double.parse(result);

                            display = "${"$numOne " + cal} ";
                          }
                          op = buttons[index];
                          preOp = op;
                          result = '';
                        } else if (buttons[index] == '=') {
                          if (numOne != 0 && result.isNotEmpty) {
                            numTwo = double.parse(result);
                            display = '${'$numOne ' + cal} $numTwo = ';

                            if (op == '+') {
                              finalResult = add();
                            } else if (op == '-') {
                              finalResult = sub();
                            } else if (op == 'x') {
                              finalResult = mul();
                            } else if (op == '/') {
                              finalResult = div();
                            }
                            op = '';
                            result = '';
                          }
                        } else if (buttons[index] == '%') {
                          result = (numOne / 100).toString();
                          finalResult = doesContainDecimal(result);
                        } else if (buttons[index] == '.') {
                          if (!result.contains('.')) {
                            result += '.';
                          }
                          finalResult = result;
                        } else if (buttons[index] == '+/-') {
                          result = result.startsWith('-')
                              ? result.substring(1)
                              : '+' + result;
                          finalResult = result;
                        } else {
                          result += buttons[index];
                          finalResult = result;
                        }
                        setState(() {
                          text = finalResult;
                          _resultValue.text = finalResult;
                        });
                      },
                      child: Center(
                        child: Text(
                          buttons[index],
                          style: TextStyle(
                            color: colorsOfCaCulator(buttons[index]),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

Color colorsOfCaCulator(String clr) {
  if (clr == "M+" || clr == "M-" || clr == "MC") {
    return Colors.amber;
  }
  if (clr == "AC") return Colors.blue.shade800;
  if (clr == "/" || clr == "X" || clr == "-" || clr == "+" || clr == "=") {
    return Colors.red;
  } else {
    return Colors.black;
  }
}

dynamic display = '';
dynamic cal = '';
dynamic result = '';
dynamic finalResult = '';
dynamic op = '';
dynamic preOp = '';
dynamic text = '0';
dynamic res = '';
double numOne = 0;
double numTwo = 0;
String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String doesContainDecimal(dynamic result) {
  if (result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if (!(int.parse(splitDecimal[1]) > 0)) {
      return result = splitDecimal[0].toString();
    }
  }
  return result;
}
