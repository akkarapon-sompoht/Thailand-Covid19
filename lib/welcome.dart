import 'package:flutter/material.dart';
import 'package:getAPIDemos/get_api.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text('Get Covid Stat via API'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetAPI()));
                },
              ),
          ],
        ),
      ),
    );
  }
}
