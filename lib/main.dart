import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum04_mi2b_02/widged/KonversiSuhu.dart';
import 'package:praktikum04_mi2b_02/widged/PerhitunganTerakhir.dart';
import 'package:praktikum04_mi2b_02/widged/RiwayatPerhitungan.dart';
import 'package:praktikum04_mi2b_02/widged/TargetPerhitungan.dart';
import 'package:praktikum04_mi2b_02/widged/inputSuhu.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _adam=TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin","Reamur","Fahrenheit"];
  String selectedDropdown="Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil=[];

  void onDropdownChanged(Object? value) {
    return setState(() {
                selectedDropdown=value.toString();
              });
  }
  void konversiSuhu() {
    return setState(() {
      if(_adam.text.isNotEmpty){
      switch (selectedDropdown) {
        case "Kelvin":
        hasilPerhitungan=
        int.parse(_adam.text)+273.15;                              
          break;
        case "Reamur":
        hasilPerhitungan=
        int.parse(_adam.text)*4/5;                              
          break;
        case "Fahrenheit":
        hasilPerhitungan=
        (int.parse(_adam.text)*9/5)+32;                              
          break;
      }
      listHasil.add("Konversi dari "+_adam.text+" Celsius ke "
      +selectedDropdown+" Dengan Hasil : "+hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(adam: _adam),
            SizedBox(height:8),
            TargetPerhitungan(
              selectedDropdown: selectedDropdown, 
              listSatuanSuhu: listSatuanSuhu,
              onDropdownChanged: onDropdownChanged,
              ),
              SizedBox(height: 10),
              Text("Hasil",
              style: TextStyle(
                fontSize: 20
                ),
              ),
              perhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
              SizedBox(height: 10),
              KonversiSuhu(onPressed: konversiSuhu,),
              SizedBox(height: 10),
              Text("Riwayat Konversi",
              style: TextStyle(
                fontSize: 20
                ),
              ),
              SizedBox(height: 10),
              riwayatPerhitungan(listHasil: listHasil),   
          ],
        ),
      ),
    );
  }  
}









