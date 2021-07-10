import 'package:flutter/material.dart';

class ProfileCardInfo extends StatelessWidget {
  final String icon;
  final String text;
  const ProfileCardInfo({
    Key key,
    @required this.size,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        SizedBox(
          width: size.width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: Theme.of(context).textTheme.headline2),
            Container(
              width: size.width * 0.5,
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing",
                  style: Theme.of(context).textTheme.headline3),
            )
          ],
        ),
      ],
    );
  }
}
