import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testing/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  //firebaseAUth instance
  final _auth = FirebaseAuth.instance;

  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //firstName field
    final firstNameField = TextFormField(
        style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          //regex for Minimum six characters,
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return ("FirstName cannot be empty");
          }
          if(!regex.hasMatch(value)){
            return ("Minimum 3 characters");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle,color: Colors.deepPurple,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
        ));

    //second name field
    final secondNameField = TextFormField(
        style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          //regex for Minimum six characters,
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return ("secondName cannot be empty");
          }
          if(!regex.hasMatch(value)){
            return ("Minimum 3 characters");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle,color: Colors.deepPurple,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          hintStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
        ));

    //email field
    final emailField = TextFormField(
        style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
        autofocus: false,
        controller: emailEditingController,
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
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,color: Colors.deepPurple,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
        ));

    //password field
    final passwordField = TextFormField(
        style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
        autofocus: false,
        controller: passwordEditingController,
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
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,color: Colors.deepPurple,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
        ));

    //confirm field
    final confirmPasswordField = TextFormField(
        style: TextStyle(color:Colors.deepPurple,fontSize: 20.0),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
         if(confirmPasswordEditingController.text != passwordEditingController.text)
         {
           return ("Password dont Match");
         }
         return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key,color: Colors.deepPurple,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm  Password",
          hintStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple)),
        ));


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.deepPurple,),
          onPressed: ()=>Navigator.pushNamed(context,'/loginPage'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.0,),
              Text(
                'Take Time ',
                style: TextStyle(fontSize: 45.0,color: Colors.deepPurple),
              ),
              Form(
              key: _formKey,
                child:Column(
                  children: [
                    SizedBox(height: 85.0,),
                    firstNameField,
                    SizedBox(height: 35.0,),
                    secondNameField,
                    SizedBox(height: 35.0,),
                    emailField,
                    SizedBox(height: 35.0,),
                    passwordField,
                    SizedBox(height: 35.0,),
                    confirmPasswordField,
                    SizedBox(height: 18.0,),
                    Center(
                      child: RaisedButton(onPressed: (){
                            SignUp(emailEditingController.text, passwordEditingController.text);
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
                )
            ),
            ]
          ),
        ),
      ),
    ),);
  }

  void SignUp(String email,String password) async{
    if(_formKey.currentState!.validate())
    {
        await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>{
            postDetailsToFirestore(),
        }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }
  postDetailsToFirestore() async{
    //calling our firestore and then calling our user model and then finallly sending our values

    FirebaseFirestore firebaseFirestore =  FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully ");

    Navigator.pushNamed(context,' /loginPage');
  }
}
