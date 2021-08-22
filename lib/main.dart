import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: Myapp(),
    ),
  );
}

var output = "Output will be displayed here";
var cmd;

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  web(cmd) async {
    var url = Uri.parse("http://192.168.52.80:80/cgi-bin/cmdexecutor?x=" + cmd);
    //var res = await http.post(url, body: {"x": "date"});
    var res = await http.get(url);
    print(res.statusCode);
    print(res.body);
    setState(() {
      output = res.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Command Executor",
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              cursorHeight: 30,
              decoration: InputDecoration(
                labelText: "Command",
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            TextButton(
              onPressed: () {
                print("Govind Bhardwaj");
                web(cmd);
                //print(cmd);
              },
              child: Text("Submit"),
              style: ButtonStyle(),
            ),
            Center(child: Text(output)),
          ],
        ),
      ),
    );
  }
}
