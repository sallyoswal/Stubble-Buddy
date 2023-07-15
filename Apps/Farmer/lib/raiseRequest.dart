import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddy/cofirmed.dart';
import 'package:stubblebuddy/menuPage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

Future<Album> createAlbum(String requestId, String farmerId, String farmerName) async {
  final http.Response response = await http.post(
    'https://h2u86uxakd.execute-api.us-east-1.amazonaws.com/default/PostFarmerRequest',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'requestId' : requestId,
      'farmerId' : farmerId,
      'farmerName' : farmerName,
    }),
  );
  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String requestId;
  final String farmerId;
  final String farmerName;

//  final String title;

  Album({this.requestId, this.farmerId, this.farmerName});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      requestId: json['requestId'],
      farmerId: json['farmerId'],
      farmerName:  json['farmerName'],
    );
  }
}

class RaiseReqPage extends StatefulWidget {
  RaiseReqPage({Key key}) : super(key: key);
  @override
  _RaiseReqPageState createState() => new _RaiseReqPageState();
}

class _RaiseReqPageState extends State<RaiseReqPage> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#002366"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                Text(
                  'Raise a collection request',
                  style: TextStyle(
                    fontSize: 20,
                    color: HexColor("#FFFFFF"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: (Radius.circular(30.0)), topLeft: (Radius.circular(30.0))),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage('images/LoginPage.png'),
                      fit: BoxFit.cover,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 36, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 60),
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Name - Ramesh Sutar',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Phone - 999252xxx9',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Farm Adress - Farm No.132, Dule bypass road, Near Water tank, Dhule, Maharashtra',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Pincode - 424001',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 50,),
                              Divider(
                                color: HexColor("#707070"),
                                thickness: 1,
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Confirm your details",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor("#707070")
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      String hr = DateTime.now().hour.toString();
                                      String min = DateTime.now().minute.toString();
                                      String sec = DateTime.now().second.toString();
                                      Random random = new Random();
                                      String ranNum = random.nextInt(100).toString();
                                      String reqId = "TF" + hr + min + sec + ranNum;
                                      print(reqId);
                                      setState(() {
                                        _futureAlbum = createAlbum(reqId, "101", "Purvesh");
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ConfirmPage()),
                                      );
                                    },
                                    color: HexColor("#002366"),
                                    child: Text(
                                      'Raise',
                                      style: TextStyle(
                                          color: Colors.yellowAccent,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}