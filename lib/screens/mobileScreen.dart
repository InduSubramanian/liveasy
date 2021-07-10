import 'package:flutter/material.dart';
import 'package:liveasy/screens/verifyScreen.dart';

import '../widgets/Background.dart';

class MobileScreen extends StatefulWidget {
  MobileScreen({Key key}) : super(key: key);

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  String number;
  bool _valid = true;
  @override
  Widget build(BuildContext context) {
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
          child: Image.asset('./assets/images/x.png'),
        ),
      ),
      body: Background(
        active: false,
        mainBg: true,
        child: Container(
          height: size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Text("Please enter your mobile number",
                style: Theme.of(context).textTheme.headline1),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.4,
              child: Text(
                "You’ll receive a 6 digit code to verify next.",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('./assets/images/India.png'),
                  SizedBox(width: size.width * 0.06),
                  Text("+91  -", style: Theme.of(context).textTheme.headline5),
                  SizedBox(width: size.width * 0.06),
                  SizedBox(
                    width: size.width * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.headline5,
                      maxLength: 10,
                      showCursor: true,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        labelStyle: Theme.of(context).textTheme.headline6,
                        errorText: _valid ? null : 'Enter a proper number',
                      ),
                      maxLengthEnforced: true,
                      onSubmitted: (value) {
                        if (value.length == 10) {
                          setState(() {
                            _valid = true;
                            number = value;
                            // print(number);
                          });
                        } else {
                          setState(() {
                            _valid = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            FlatButton(
                color: Color(0xff2E3B62),
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: size.width * 0.25),
                // Theme.of(context).buttonTheme,
                onPressed: () {
                  if (_valid == true && number != null) {
                    // Navigator.pushNamed(context, '/VerifyScreen',
                    //     arguments: '+91' + number);
                    print("Moving to next page");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => VerifyScreen(
                          number: number,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "CONTINUE",
                  style: Theme.of(context).textTheme.button,
                ))
          ]),
        ),
      ),
    );
  }
}
