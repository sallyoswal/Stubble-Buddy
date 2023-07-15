import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddycompany/loginPage.dart';
import 'package:stubblebuddycompany/raiseRequest.dart';
import 'package:stubblebuddycompany/settingsPage.dart';
import 'package:stubblebuddycompany/trackPage.dart';

import 'aboutUs.dart';
import 'orderPage.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => new _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/companyIm.jpg'),
              fit: BoxFit.cover,
            )
        ),

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: (Radius.circular(30.0)), bottomLeft: (Radius.circular(30.0))),
                      color: HexColor("#002366"),
                    ),
                  ),

                  Positioned(
                    bottom: -50.0,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/UserImage.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              FlatButton(
                onPressed: null,
//                onPressed: (){
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => RegPage()),
//                  );
//                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: HexColor("#002366"),
                      size: 20,
                    ),
                    Text(
                      "Update Profile",
                      style: TextStyle(
                        color: HexColor("#002366"),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RaiseReqPage()),
                      );
                    },
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 125,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                            color: HexColor("#FFFFFF"),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                            child: Text(
                              'Order Stubble',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 40.0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: HexColor("#002366"),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrackPage()),
                      );
                    },
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 125,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                            color: HexColor("#FFFFFF"),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                            child: Text(
                              'Track my Request',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 40.0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: HexColor("#002366"),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 35,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 65,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderPage()),
                      );
                    },
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 125,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                            color: HexColor("#FFFFFF"),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                            child: Text(
                              'View Past Orders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 40.0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: HexColor("#002366"),
                            child: Icon(
                              Icons.view_list,
                              color: Colors.white,
                              size: 35,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 125,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(11.0)),
                            color: HexColor("#FFFFFF"),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                            child: Text(
                              'Cancel my Request',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 40.0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: HexColor("#002366"),
                            child: Icon(
                              Icons.block,
                              color: Colors.white,
                              size: 30,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 65,),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11.0)),
                  color: HexColor("#FFFFFF"),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: (){
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.exit_to_app,
                              size: 20,
                            ),
                            Text(
                              'Sign Out',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AppSettings()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              size: 20,
                            ),
                            Text(
                              'Settings',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutPage()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.info,
                              size: 20,
                            ),
                            Text(
                              'About Us',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AppSettings()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.help,
                              size: 20,
                            ),
                            Text(
                              'Help',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#002366"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
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