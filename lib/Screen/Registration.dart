
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:saloonapp23062020/Screen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saloonapp23062020/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

  //final _phoneController = TextEditingController();
  //final _codeController = TextEditingController();

  Future<bool> registerUser (String email,String pass,String name,String
  url) async{
    FirebaseAuth _auth=FirebaseAuth.instance;
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;

      UserUpdateInfo info =UserUpdateInfo();
      info.displayName=name;
      info.photoUrl=url;
      user.updateProfile(info);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'Registration',
                  style: TextStyle(

                    fontSize: 36,
                    color: Colors.blue,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Email'),
              TextFormField(
                decoration: InputDecoration(
                  //icon: Icon(Icons.send),
                  hintText: 'enter email',
                  // helperText: 'Helper Text',
                  //counterText: '0 characters',
                  //border: const OutlineInputBorder(),
                ),
                controller: _emailController,
              ),
              SizedBox(
                height: 30,
              ),
              Text('Password'),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter password',
                ),
                controller: _passController,
              ),
              SizedBox(
                height: 30,
              ),
              Text('Name'),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter name',
                ),
                controller: _nameController,
              ),
              SizedBox(
                height: 30,
              ),
              Text('Image Url'),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter url',


                ),
                controller: _imageController,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  padding: EdgeInsets.all(16),
                  onPressed: () async{
                    final email=_emailController.text.toString().trim();
                    final pass=_passController.text.toString().trim();
                    final name=_nameController.text.toString().trim();
                    final url=_imageController.text.toString().trim();
                    bool result= await registerUser(email, pass, name, url);
                    if(result){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      ));
                    }else{
                      print('error');

                    }

                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),

                  ),
                ),
                color: Colors.blue,

              ),
              Container(
                child: MaterialButton(
                    child: Text("already registered click to login"),
                    color: Colors.grey,
                    textColor: Colors.black,
                    onPressed:(){
                      Navigator.of(context).pushNamed(
                        '/',

                      );

                    }
                ),

              )


            ],
          ),
        ),
      ),
    );
  }

}