import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddy/menuPage.dart';
import 'package:stubblebuddy/regPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#002366"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 16,
                color: HexColor("#FFFFFF"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Stubble Buddy !',
              style: TextStyle(
                fontSize: 27,
                color: HexColor("#FFFFFF"),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35),
            
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-140,


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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 24),
                    Text(
                      'Enter your credentials to continue ...',
                      style: TextStyle(
                        color: HexColor("#000000"),
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),

                      child: TextFormField(
                        keyboardType: TextInputType.phone,
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
                        labelText: 'Phone number',
                      ),

                    ),
                    ),
                    SizedBox(height: 14),
                    Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),

                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
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
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width - 80,
                      height: 44,
                      child: FlatButton(
                        color: HexColor("#002366"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenuPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          'LOGIN >>',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Divider(
                      endIndent: 10,
                      color: HexColor("#676060BA"),
                      thickness: 2,
                    ),
                    FlatButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegPage()),
                        );
                      },
                      child: Text(
                        "Don't have an account ? Sign up",
                        style: TextStyle(
                          color: HexColor("#000000"),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            )
          ],
        ),
      ),
    );
  }

}