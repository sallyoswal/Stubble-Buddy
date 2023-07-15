import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddy/chooseLanguage.dart';
import 'package:stubblebuddy/loginPage.dart';
import 'package:stubblebuddy/regPage.dart';

class HindiHomePage extends StatefulWidget {
  @override
  _HindiHomePageState createState() => new _HindiHomePageState();

}

class _HindiHomePageState extends State<HindiHomePage> {
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
                height: 48,
              ),

              Image.asset('images/Logo.png',
                height: 106,
                width: 106,),

              SizedBox(
                height: 60,
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    color: Colors.grey[300],
                    highlightColor: Colors.purple,
                    child: Text(
                      'लॉग इन करें',
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
                        MaterialPageRoute(builder: (context) => RegPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.grey[300],
                    highlightColor: Colors.orange,
                    child: Text(
                      'रजिस्टर करें',
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
                        MaterialPageRoute(builder: (context) => ChooseLangPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.grey[300],
                    child: Text(
                      'भाषा बदलो',
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
                  minWidth: 70,
                  height: 23,
                  child: FlatButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    disabledColor: Colors.grey[300],
                    child: Text(
                      'मदद',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#000000"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}