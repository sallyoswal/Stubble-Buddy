import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddycompany/cofirmed.dart';
import 'package:stubblebuddycompany/menuPage.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stubblebuddycompany/trackPage.dart';

Future<Album> createAlbum(String requestId, String companyId, String companyName, String stubbleAmt) async {
  final http.Response response = await http.post(
    'https://8zbh2jauhf.execute-api.us-east-1.amazonaws.com/default/PostCompanyRequest',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'requestId' : requestId,
      'companyId' : companyId,
      'companyName' : companyName,
      'stubbleAmt' : stubbleAmt,
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
  final String companyId;
  final String companyName;
  final String stubbleAmt;

//  final String title;

  Album({this.requestId, this.companyId, this.companyName, this.stubbleAmt});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      requestId: json['requestId'],
      companyId: json['companyId'],
      companyName:  json['companyName'],
      stubbleAmt:  json['stubbleAmt'],

    );
  }
}
class RaiseReqPage extends StatefulWidget {
  RaiseReqPage({Key key}) : super(key: key);
  @override
  _RaiseReqPageState createState() => new _RaiseReqPageState();
}

class _RaiseReqPageState extends State<RaiseReqPage> {
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
                  onPressed: (){
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
                  'Enter quantity',
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
                      image: AssetImage('images/companyIm.jpg'),
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
                        height: 180,
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
                                'Name - John Carter',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Work Email - John@amazon.com',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Company Adress - Building No. 12C, Inorbit Mall Road, Vittal Rao Nagar, Madhapur, Hyderabad',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Pincode - 500081',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(11)),
                            ),

                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.words,
                              textAlign: TextAlign.start,
                              cursorColor: HexColor("#002366"),
                              cursorRadius: Radius.circular(16.0),
                              cursorWidth: 5.0,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                focusColor: HexColor("#FFFFFF"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                labelText: 'Enter stubble quantity in Tons',
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              String hr = DateTime.now().hour.toString();
                              String min = DateTime.now().minute.toString();
                              String sec = DateTime.now().second.toString();
                              Random random = new Random();
                              String ranNum = random.nextInt(100).toString();
                              String reqId = "TC" + hr + min + sec + ranNum;
                              print(reqId);
                              setState(() {
                                _futureAlbum = createAlbum(reqId, "C3", "RedBrick", "45");
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TrackPage()),
                              );
                            },
                            color: HexColor("#002366"),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
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