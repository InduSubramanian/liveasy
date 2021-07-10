// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../widgets/Background.dart';

class VerifyScreen extends StatefulWidget {
  final String number;
  VerifyScreen({Key key, this.number}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String _verificationCode;
  bool _resending = false;
  bool _verified;

  @override
  void initState() {
    super.initState();
    _verifyPhone();
    _verified = false;
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final _pinPutController = TextEditingController();
    final _pinPutFocusNode = FocusNode();
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color(0xff93D2F3),
      // borderRadius: BorderRadius.circular(5.0),
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0x00ffffff),
          elevation: 0,
          leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset('./assets/images/back.png'),
          ),
        ),
        body: Background(
          active: false,
          mainBg: true,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Verify Phone",
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.5,
                  child: Text(
                    "Code is sent to ${widget.number} ",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PinPut(
                    fieldsCount: 6,
                    fieldsAlignment: MainAxisAlignment.spaceAround,
                    textStyle: Theme.of(context).textTheme.headline5,
                    // separator: SizedBox(width: size.width * 0.02),
                    eachFieldPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    onSubmit: (String pin) async {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                          .then((value) {
                        if (value.user != null) {
                          print("UserLogged in: ${value.user}");
                          Navigator.pushNamed(context, '/ProfileScreen');
                        } else {
                          print("User value returned  is null");
                        }
                      });
                    },
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.scale,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive the code?",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_resending) {
                          _verifyPhone();
                        }
                      },
                      child: Text(
                        "Request Again",
                        style: _resending
                            ? Theme.of(context).textTheme.subtitle2
                            : Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                FlatButton(
                    color: Color(0xff2E3B62),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                        horizontal: size.width * 0.1),
                    // Theme.of(context).buttonTheme,
                    onPressed: () {
                      if (_verified) {
                        Navigator.pushReplacementNamed(
                          context,
                          '/ProfileScreen',
                        );
                      }
                    },
                    child: Text(
                      "VERIFY AND CONTINUE",
                      style: Theme.of(context).textTheme.button,
                    ))
              ],
            ),
          ),
        ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + widget.number, //This has +91 with it
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              print("Automatically checked otp and we are shifting");
              Navigator.pushReplacementNamed(
                  context, '/ProfileScreen'); // setState(() {
              //   _verified = true;
              // });
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          setState(() {
            _verified = false;
          });
        },
        codeSent: (String code, int retId) {
          setState(() {
            _verificationCode = code;
          });
        },
        codeAutoRetrievalTimeout: (String code) {
          setState(() {
            _resending = true;
            _verified = false;
          });
        },
        timeout: Duration(seconds: 60));
  }
}
