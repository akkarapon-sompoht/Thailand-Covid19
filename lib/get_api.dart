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

  final keys = [
    'confirmed',
    'recovered',
    'hospitalized',
    'newConfirmed',
  ];

  Future<String> _GetCovid19Today() async {
    var respone = await Http.get('https://covid19.th-stat.com/api/open/today');
    jsonData = jsonDecode(utf8.decode(respone.bodyBytes));

    data['confirmed'] = jsonData['Confirmed'];
    data['recovered'] = jsonData['Recovered'];
    data['hospitalized'] = jsonData['Hospitalized'];
    data['newConfirmed'] = jsonData['NewConfirmed'];

    return "Ok";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สถิติทั่วไป'),
      ),
      body: Center(
          child: new FutureBuilder(
              future: _GetCovid19Today(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.orange[100],
                          elevation: 1,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: new Container(
                            padding: new EdgeInsets.all(32.0),
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  '${keys[index]}',
                                ),
                                new Text(
                                  '${data[keys[index]]}',
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}