import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jsonform/flutter_jsonform.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterJsonForm form;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _formInit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          print(form.result);
        }),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Center(
                  child: form.render(),
                ),
              ),
      ),
    );
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/form.json');
  }

  _formInit() async {
    String definition = await loadJson();
    setState(() {
      _loading = false;
      form = new FlutterJsonForm.fromString(definition);
    });
  }
}
