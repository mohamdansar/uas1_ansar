import 'package:flutter/material.dart';
import 'package:uas1_ansar/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API DEMO"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null)
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.created
                  : "Tidak ada data"),
              RaisedButton(
                onPressed: () {
                  PostResult.connectToAPI("ansar", "programmer").then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
