import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddy/hindiHomePage.dart';
import 'package:stubblebuddy/homePage.dart';
import 'package:stubblebuddy/loginPage.dart';
import 'package:stubblebuddy/regPage.dart';

class ChooseLangPage extends StatefulWidget {
  @override
  _ChooseLangPageState createState() => new _ChooseLangPageState();

}

class _ChooseLangPageState extends State<ChooseLangPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bgimg.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),


              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    color: Colors.grey[300],
                    highlightColor: Colors.purple,
                    child: Text(
                      'ENGLISH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 24,
              ),

              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HindiHomePage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.grey[300],
                    highlightColor: Colors.orange,
                    child: Text(
                      'हिन्दी',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 24,
              ),

              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    child: Text(
                      'मराठी',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 14,
              ),

              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    child: Text(
                      'தமிழ்',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 14,
              ),

              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    child: Text(
                      'ಕನ್ನಡ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 14,
              ),

              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    child: Text(
                      'മലയാളം',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 14,
              ),

              Opacity(
                opacity: 0.8,
                child: ButtonTheme(
                  minWidth: 266,
                  height: 44,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    color: Colors.grey[300],
                    highlightColor: Colors.purple,
                    child: Text(
                      'ਪੰਜਾਬੀ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

}