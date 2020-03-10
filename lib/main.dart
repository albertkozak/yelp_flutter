import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void fetchBusinessList() async {
    await DotEnv().load('.env');
    var response = await http.get(
      'https://api.yelp.com/v3/businesses/search' +
          "?&latitude=49.2820&longitude=-123.1171",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${DotEnv().env['API_KEY']}"
      },
    );
    print(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    fetchBusinessList();
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Center(
        child: Text("Yelp Businesses"),
      ),
    );
  }
}
