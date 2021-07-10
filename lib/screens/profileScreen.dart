import 'package:flutter/material.dart';

import '../widgets/ProfileCardInfo.dart';

enum Profile { shipper, transporter }

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile _radioVal;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please select your profile",
                style: Theme.of(context).textTheme.headline1),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.03),
                    child: RadioListTile(
                        title: ProfileCardInfo(
                          size: size,
                          icon: './assets/images/shipper.png',
                          text: 'Shipper',
                        ),
                        value: Profile.transporter,
                        groupValue: _radioVal,
                        onChanged: (value) {
                          setState(() {
                            _radioVal = value;
                          });
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.03),
                    child: RadioListTile(
                        title: ProfileCardInfo(
                          size: size,
                          icon: './assets/images/transporter.png',
                          text: "Transporter",
                        ),
                        value: Profile.shipper,
                        groupValue: _radioVal,
                        onChanged: (value) {
                          setState(() {
                            _radioVal = value;
                          });
                        }),
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
                    vertical: size.height * 0.03, horizontal: size.width * 0.2),
                // Theme.of(context).buttonTheme,
                onPressed: () {
                  Navigator.pushNamed(context, '/MobileScreen');
                },
                child: Text(
                  "CONTINUE",
                  style: Theme.of(context).textTheme.button,
                ))
          ],
        ),
      ),
    );
  }
}
