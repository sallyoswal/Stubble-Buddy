import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddycompany/menuPage.dart';
import 'package:stubblebuddycompany/scannerPage.dart';

class ValidPage extends StatefulWidget {
  @override
  _ValidPageState createState() => new _ValidPageState();
}

class _ValidPageState extends State<ValidPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor("#002366"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              'Hey !  User',
              style: TextStyle(
                fontSize: 27,
                color: HexColor("#FFFFFF"),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 52),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 55),
                    Container(
                      height: 119,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Center(
                        child: Text(
                          'Do you want to validate your information for an automated process ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 41),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(

                          height: 44,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ScannerPage()),
                              );
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: HexColor("#002366"),
                            disabledColor: HexColor("#002366"),
                            highlightColor: Colors.red,
                            child: Text(
                              'YES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#FFFFFF"),
                              ),
                            ),
                          ),
                        ),
                        ButtonTheme(

                          height: 44,
                          child: FlatButton(
                            onPressed: () {
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MenuPage()),
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: HexColor("#000000"),
                            child: Text(
                              'SKIP FOR NOW',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#FFFFFF"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),






                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

}