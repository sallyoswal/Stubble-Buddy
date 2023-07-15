
import 'package:speech_recognition/speech_recognition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:stubblebuddy/homePage.dart';
import 'package:stubblebuddy/map.dart';
import 'package:stubblebuddy/validationPage.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => new _RegPageState();
}

class _RegPageState extends State<RegPage> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();

  }


  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 22,
                    color: HexColor("#FFFFFF"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height, //TODO - -100 here for height
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: (Radius.circular(30.0)), topLeft: (Radius.circular(30.0))),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('images/LoginPage.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 28),
                    Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),

                      child: TextFormField(
                        keyboardType: TextInputType.text,
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
                          labelText: 'Enter Name',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                          labelText: 'Enter Phone number',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                          labelText: 'Enter Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                          labelText: 'Retype Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 32),

                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width - 80,
                      height: 44,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: HexColor("#000000"),
                        highlightColor: Colors.white,
                        child: Text(
                          'Detect Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      endIndent: 10,
                      color: HexColor("#676060BA"),
                      thickness: 2,
                    ),
                    SizedBox(height: 20),
//                    Container(
//                      decoration: new BoxDecoration(
//                        color: Colors.white,
//                        shape: BoxShape.rectangle,
//                        borderRadius: BorderRadius.all(Radius.circular(11)),
//                      ),
//
//                      child: TextFormField(
//                        keyboardType: TextInputType.multiline,
//                        textCapitalization: TextCapitalization.words,
//                        textAlign: TextAlign.start,
//                        cursorColor: HexColor("#002366"),
//                        cursorRadius: Radius.circular(16.0),
//                        cursorWidth: 5.0,
//                        style: TextStyle(
//                          fontSize: 15,
//                          fontWeight: FontWeight.w600,
//                        ),
//                        decoration: InputDecoration(
//                          focusColor: HexColor("#FFFFFF"),
//                          border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(11),
//                          ),
//                          labelText: "Manually Enter Farm's Location",
//                        ),
//                      ),
//                    ),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent[100],
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                resultText,

                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                          Container(
                            width: 35,
                            child: FloatingActionButton(
                              shape: CircleBorder(),
                              child: Icon(Icons.mic, size: 20,),
                              onPressed: () {
                                if (_isAvailable && !_isListening)
                                  _speechRecognition
                                      .listen(locale: "en_US")
                                      .then((result) => print('$result'));
                              },
                              backgroundColor: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width - 80,
                      height: 44,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ValidPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: HexColor("#002366"),
                        highlightColor: Colors.red,
                        child: Text(
                          'REGISTER >>',
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
              ),

            )
          ],
        ),
      ),
    );
  }

}