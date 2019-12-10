import 'package:flutter/material.dart';
import 'package:uni/main.dart';

class CustomBox extends StatelessWidget {
  final String name;
  final IconData icon;

  CustomBox(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(6.0),
      height: 160,
      decoration: myBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          SizedBox(height: 10),
          Text(name,
              style: new TextStyle(
                fontSize: 21.0,
                color: colorPrimary,
              )),
        ],
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.grey[100],
    border: Border.all(
        width: 4, //                   <--- border width here
        color: colorPrimary),
    borderRadius: BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
        ),
  );
}
