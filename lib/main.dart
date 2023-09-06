import 'package:flutter/material.dart';

class ConversionApp extends StatefulWidget {
  const ConversionApp({super.key});
  @override
  ConversionAppState createState() => ConversionAppState();
}

class ConversionAppState extends State<ConversionApp> {
  final TextEditingController _inputController = TextEditingController();
  String _output = '';

  void _convertGBtoMB() {
    setState(() {
      double gb = double.tryParse(_inputController.text) ?? 0.0;
      double mb = gb * 1024;
      _output = '${gb.toString()} GB = ${mb.toString()} MB';
    });
  }

  void _convertMBtoGB() {
    setState(() {
      double mb = double.tryParse(_inputController.text) ?? 0.0;
      double gb = mb / 1024;
      _output = '${mb.toString()} MB = ${gb.toString()} GB';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversión de GB y MB',
          style: TextStyle(
            fontFamily: 'Oldenburg',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFA61414),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  hintText: 'Ingrese valor',
                  labelText: "Ingrese valor",
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Oswald',
                    fontSize: 20,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Oswald',
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 131, 131, 131),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Oswald',
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: _convertGBtoMB,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFA61414),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size.fromHeight(50),
                        ),
                      ),
                      child: const Text(
                        'GB a MB',
                        style: TextStyle(fontSize: 20, fontFamily: 'Oswald'),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Espacio entre los botones
                  Flexible(
                    child: ElevatedButton(
                      onPressed: _convertMBtoGB,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFA61414),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size.fromHeight(50),
                        ),
                      ),
                      child: const Text(
                        'MB a GB',
                        style: TextStyle(fontSize: 20, fontFamily: 'Oswald'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                _output,
                style: const TextStyle(
                    color: Colors.white, fontSize: 24.0, fontFamily: 'Oswald'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ConversionApp(),
  ));
}
