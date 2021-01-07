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
        title: Text('GET Covid API'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _GetCovid19Today(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return new Container(
                child: new Column(
                  children: <Widget>[
                    Text('newConfirmed'),
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
