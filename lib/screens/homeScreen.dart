import 'package:flutter/material.dart';

import '../widgets/Background.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _chosenValue;
  bool _active;
  @override
  void initState() {
    super.initState();
    _active = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        active: _active,
        child: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('./assets/images/Icon.png'),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Text("Please select your language",
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.4,
                  child: Text(
                    "You can change the language at any time.",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                    width: size.width * 0.6,
                    decoration: BoxDecoration(border: Border.all()),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    child: DropdownButton(
                      hint: Text("English",
                          style: Theme.of(context).textTheme.headline4),
                      value: _chosenValue,
                      items: <String>['English', 'Hindi', 'Tamil']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline5,
                            ));
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _active = true;
                          _chosenValue = val;
                        });
                      },
                    )),
                SizedBox(
                  height: size.height * 0.04,
                ),
                FlatButton(
                    color: Color(0xff2E3B62),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                        horizontal: size.width * 0.2),
                    // Theme.of(context).buttonTheme,
                    onPressed: () {
                      Navigator.pushNamed(context, '/MobileScreen');
                    },
                    child: Text(
                      "NEXT",
                      style: Theme.of(context).textTheme.button,
                    ))
              ]),
        ),
        mainBg: false,
      ),
    );
  }
}
