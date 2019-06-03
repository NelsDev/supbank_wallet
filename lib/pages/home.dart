import 'package:flutter/material.dart';
import 'package:supbank_wallet/pages/login.dart';
import 'package:supbank_wallet/utils/screen_size.dart';
import 'package:supbank_wallet/widgets/formular/transactionFormular.dart';
import 'package:supbank_wallet/utils/api/requestSendAPI.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //TODO FUNCTION TO RETURN BALANCE WITH ID FROM THE USER
    //showRequestBalanceAPI(3);

    //TODO BALANCE DEFAULT
    final double balanceValue = 1208;

    final sendButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          requestSendAPI(context, publicKey, privateKey, amount);
          performSend();
        },
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: Text('Send', style: TextStyle(color: Colors.blueAccent)),
      ),
    );

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 20,
          top: 70,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                color: Colors.black87,
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(24),
                      topRight: const Radius.circular(0),
                      bottomLeft: const Radius.circular(24),
                      bottomRight: const Radius.circular(0)),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Account balance",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          Row(
            children: <Widget>[
              colorCard(balanceValue, 1, context, Color(0xFF1b5bff)),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 10, bottom: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Send Money",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
              child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 10.0, right: 30.0),
            children: <Widget>[
              //logo,
              SizedBox(height: 20.0),
              publicKeyEnter,
              SizedBox(height: 20.0),
              privateKeyEnter,
              SizedBox(height: 20.0),
              amountEnter,
              SizedBox(height: 20.0),
              sendButton
            ],
          )),
        ],
      ),
    );
  }

  Widget colorCard(double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: screenAwareSize(90, context),
      width: _media.width / 2 - 25,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'images/logo2.png',
            width: 30.0,
            height: 30.0,
          ),
          Text(
            " ${amount.toString()} PC ",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
