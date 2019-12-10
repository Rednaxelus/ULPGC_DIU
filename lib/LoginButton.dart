import 'package:flutter/material.dart';

Container giveLoginButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(6.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(0, 0, 0, 0),
      border: Border.all(
          width: 2, //                   <--- border width here
          color: Theme
              .of(context)
              .accentColor),
      borderRadius: BorderRadius.all(
          Radius.circular(20.0) //                 <--- border radius here
      ),
    ),
    child: FlatButton(
      onPressed: () {},
      child: Text("Login",
          style: new TextStyle(
            fontSize: 21.0,
            color: Theme
                .of(context)
                .accentColor,
          )),
    ),
  );
}
