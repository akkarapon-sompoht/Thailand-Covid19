import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class GetAPI extends StatefulWidget {
  GetAPI({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GetAPIState createState() => _GetAPIState();
}


class _GetAPIState extends State<GetAPI> {
  var jsonData;
  Map<String, int> data = {};

  Future<String> _GetCovid19Today() async {
    var response = await Http.get('https://covid19.th-stat.com/api/open/today');
    jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print(jsonData);

    data['confirmed'] = jsonData['Confirmed'];
    data['recovered'] = jsonData['Recovered'];
    data['hospitalized'] = jsonData['Hospitalized']; 
    data['newConfirmed'] = jsonData['NewConfirmed'];

    return "OK";

  }

  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thai Covid19 Today'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _GetCovid19Today(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return new Container(
                child: new Column(
                  children: <Widget>[
                    Text('NewConfirmed'),
                    Text('${data['newConfirmed']}'),
                    SizedBox(
                      width: 120,
                      height: 50,
                    ),
                     Text('Recovered'),
                     Text('${data['recovered']}'),
                      SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('Confirmed'),
                     Text('${data['confirmed']}'),
                      SizedBox(
                      width: 120,
                      height: 50,
                    ),
                    Text('Hospitalized'),
                     Text('${data['hospitalized']}'),
                      SizedBox(
                      width: 120,
                      height: 50,
                    ),
                  ],
                ),
              );
   body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                      ),
                    )
                  )
                  SizedBox(height: sizeBox),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: Image.asset(
                      'assets/images/covid19.jpg',
                      height: 180.0,
                    ),
                  );
            } else {
              return Center(
                child: CircularProgressIndicator(),   
              );
            }
          },
        ),
      ),
    );
  }
}
