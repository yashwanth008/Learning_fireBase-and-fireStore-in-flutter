import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black26,
          body: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  SizedBox(height: 45.0,),
                  Text(
                      'Hello',
                  style: TextStyle(fontSize: 75.0,color: Colors.deepPurple),
                  ),
                  Text(
                    'There,',
                    style: TextStyle(fontSize: 75.0,color: Colors.deepPurple),
                  ),
                  SizedBox(height: 135.0,),
              Form
                (
                key: _formKey,
                  child:Column(
                  children: [
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
                  SizedBox(height: 30.0,),
                  TextFormField(
                    style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
                    autofocus: false,
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      //regex for Minimum six characters,
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if(value!.isEmpty){
                        return ("password is required for login");
                      }
                      if(!regex.hasMatch(value)){
                        return ("Minimum six characters");
                      }
                    },
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key,color: Colors.deepPurple,),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.deepPurple),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
                    ),),
                  SizedBox(height: 15.0,),
                  Center(
                    child: RaisedButton(onPressed: (){
                      SignIn(emailController.text, passwordController.text);
                    },
                      color: Colors.black,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20.0,color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ],
              )),
                 Row(
                   children: [
                     SizedBox(width: 20,),
                     Text(
                         'Dont have an Account?',
                     style: TextStyle(color: Colors.white70),),
                     TextButton(onPressed: ()=>Navigator.pushNamed(context,'/SignUp'), child: Text('SignUp',style: TextStyle(color: Colors.deepPurple),))
                   ],
                 )
                ],
              ),
            ),
          ),
        ));
  }

  //loggin Funtion

  void SignIn(String email,String password) async
  {
    if(_formKey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.pushReplacementNamed(context, '/landingPage'),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

}

