import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        _expression = '';
        _result = '';
      } else if (value == '⌫') {
        _expression = _expression.isNotEmpty
            ? _expression.substring(0, _expression.length - 1)
            : '';
      } else if (value == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_expression.replaceAll('×', '*').replaceAll('÷', '/'));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          _result = eval.toString();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += value;
      }
    });
  }

  Widget buildButton(String text, {Color? color, Color? textColor, double fontSize = 24}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[850],
            padding: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<String> values, List<Color> colors) {
    return Row(
      children: List.generate(values.length, (i) {
        return buildButton(
          values[i],
          color: colors[i],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(color: Colors.white70, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _result,
                    style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[800]),
          buildRow(
            ['AC', '⌫', '%', '÷'],
            [Colors.grey[700]!, Colors.grey[700]!, Colors.grey[700]!, Colors.orange],
          ),
          buildRow(
            ['7', '8', '9', '×'],
            [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
          ),
          buildRow(
            ['4', '5', '6', '-'],
            [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
          ),
          buildRow(
            ['1', '2', '3', '+'],
            [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
          ),
          buildRow(
            ['00', '0', '.', '='],
            [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
          ),
        ],
      ),
    );
  }
}
