import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.iconData, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.cyan,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 22,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
