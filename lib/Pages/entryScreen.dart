import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:Scaffold(
      body:  Padding(
        padding: EdgeInsets.fromLTRB(90, 70, 70, 50),
        child: Center(
          child: Row(
            children: [
              RaisedButton(onPressed:()=>Navigator.pushNamed(context,'/loginPage'),child: Text("Login"),),
              SizedBox(width: 25,),
              RaisedButton(onPressed: ()=>Navigator.pushNamed(context,'/SignUp'),child: Text("Sign Up"),),
            ],
          )
        ),
      ),
    ));
  }
}
