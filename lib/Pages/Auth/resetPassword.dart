import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      backgroundColor: Colors.black26,

      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(height: 35,),
              Text("Recover Password",style: TextStyle(fontSize: 35,color: Colors.deepPurple),),
              SizedBox(height: 145,),
              TextFormField(
                style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
                autofocus: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return ("Please enter your Email");
                  }
                  //reg exp for email validation
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    return ("Please enter valid email ");
                  }
                  return null;
                },
                onSaved: (value) {
                  emailController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail,color: Colors.deepPurple,),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.deepPurple),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
                )),
              SizedBox(height: 35,),
              Center(
                child: RaisedButton(onPressed: (){
                          _auth.sendPasswordResetEmail(email:emailController.text).then((value) =>{
                            Navigator.pushNamed(context,'/loginPage' ),
                            Fluttertoast.showToast(msg:"Check Your Mail"),
                          });

                },
                  color: Colors.black,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Send Request',
                    style: TextStyle(fontSize: 20.0,color: Colors.deepPurple),
                  ),
                ),
              ),
       ]   ),

        ),
      ),
    );
  }
}
