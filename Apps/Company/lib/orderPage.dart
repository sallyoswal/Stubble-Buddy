import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddycompany/menuPage.dart';
import 'package:stubblebuddycompany/orderDetails.dart';
import 'package:stubblebuddycompany/trackPage.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => new _OrderPageState();

}

class _OrderPageState extends State<OrderPage> {
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
                  'Your Orders',
                  style: TextStyle(
                    fontSize: 22,
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
//              height: MediaQuery.of(context).size.height,
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
                      SizedBox(height: 30),
                      Text(
                        'Active Orders',
                        style: TextStyle(
                            color: HexColor("#000000"),
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 11),
                      Container(
                        height: 122,
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
                                'Order Id:  3256',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Order Date: 12/01/2020',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              Divider(
                                color: HexColor("#707070"),
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "On it's way !",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor("#707070")
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TrackPage()),
                                      );
                                    },
                                    color: HexColor("#002366"),
                                    child: Text(
                                      'Track',
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
                      SizedBox(height: 15),
                      Divider(
                        color: HexColor("#676060BA"),
                        thickness: 2,
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Completed Orders',
                        style: TextStyle(
                            color: HexColor("#000000"),
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 17),
                      Container(
                        height: 122,
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
                                'Order Id:  32216',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Order Date: 05/09/2019',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              Divider(
                                color: HexColor("#707070"),
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor("#707070")
                                    ),
                                  ),
                                  FlatButton(
                                    color: HexColor("#002366"),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DetailsPage()),
                                      );
                                    },

                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          color: Colors.white,
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
                      SizedBox(height: 20),
                      Container(
                        height: 122,
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
                                'Order Id:  4432',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Order Date: 30/3/2014',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              Divider(
                                color: HexColor("#707070"),
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor("#707070")
                                    ),
                                  ),
                                  FlatButton(
                                    color: HexColor("#002366"),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DetailsPage()),
                                      );
                                    },

                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          color: Colors.white,
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
                      SizedBox(height: 20),
                      Container(
                        height: 122,
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
                                'Order Id:  1892',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Order Date: 13/11/2017',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor("#363333")
                                ),
                              ),
                              Divider(
                                color: HexColor("#707070"),
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor("#707070")
                                    ),
                                  ),
                                  FlatButton(
                                    color: HexColor("#002366"),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DetailsPage()),
                                      );
                                    },

                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          color: Colors.white,
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
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}