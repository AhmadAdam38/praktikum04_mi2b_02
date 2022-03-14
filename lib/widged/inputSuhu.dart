import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required TextEditingController adam,
  }) : _adam = adam, super(key: key);

  final TextEditingController _adam;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _adam,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly ],
      decoration: InputDecoration(
        labelText: 'Celcius',
        hintText: 'Enter the temperature in celcius',
      ),
    );
  }
}