import 'package:flutter/material.dart';

class TargetPerhitungan extends StatelessWidget {
  const TargetPerhitungan({
    Key? key,
    required this.selectedDropdown,
    required this.listSatuanSuhu, 
    required this.onDropdownChanged, 
    required this.konversiSuhu,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onDropdownChanged;
  final Function konversiSuhu;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(   
      isExpanded: true,
      value:selectedDropdown,
      items: listSatuanSuhu.map((String value){
        return DropdownMenuItem<String>(
        value:value,
        child:Text(value),
        );
      }).toList(), 
      onChanged: (value){
        onDropdownChanged(value);
        konversiSuhu();
      }
      );
  }
}