import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int hasilPerhitungan = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void onDropdownChanged(Object? value) {
    return setState(() {
                selectedDropdown=value.toString();
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
            TextField(
              controller: _adam,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly ],
              decoration: InputDecoration(
                labelText: 'Celcius',
                hintText: 'Enter the temperature in celcius',
              ),
            ),
            SizedBox(height:8),
            DropdownButton(  
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
              }
              ),
              SizedBox(height: 10),
              Text("Hasil",
              style: TextStyle(
                fontSize: 20
                ),
              ),
              Text("$hasilPerhitungan",
              style: TextStyle(fontSize:32),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(_adam.text.isNotEmpty){
                          hasilPerhitungan=int.parse(_adam.text)*2;
                          switch (selectedDropdown) {
                            case "Kelvin":
                              
                              break;
                            default:
                          }
                          }
                        });
                      },
                      child: Text("Konversi Suhu"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Riwayat Konversi",style: TextStyle(
                fontSize: 20
                ),
              ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}