//import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saloonapp23062020/Services/googleSignIn.dart';

import 'package:saloonapp23062020/Route/route_genrator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saloonapp23062020/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:saloonapp23062020/Services/googleSignIn.dart';
import 'Registration.dart';
import 'package:saloonapp23062020/Services/auth.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<FirebaseUser> login(String email, String pass) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      print(user);
      return user;
    } catch (e) {
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Login"),
              SizedBox(
                height: 16,
              ),

              TextFormField(
                // decoration: InputDecoration(...),
                controller: _emailController,

              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                // decoration: InputDecoration(...),
                controller: _passController,

              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: FlatButton(
                  onPressed: () async{
                    final email=_emailController.text.toString().trim();
                    final pass=_passController.text.toString().trim();

                    FirebaseUser user=await login(email, pass);
                    if(user!=null){
                      Navigator.of(context).pushNamed(
                        '/homescreen',
                        arguments:(
                        //pass the object not the detail
                            user
                        )
                      );

                    }else{
                      print(user);

                    }
                  },
                  child: Text("Login"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  color: Colors.blue,

                ),
              ),
              SizedBox(
                height: 16,

              ),
              Container(
                child: MaterialButton(
                    child: Text("login with google"),
                    color: Colors.white,
                    textColor: Colors.amberAccent,

                    onPressed: () async {
                      // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

                      final user = await googleSignIn().googleLogIn();
                      Navigator.of(context).pushNamed('/homescreen',
                          arguments: (
                              //pass the object not the detail
                              user));
                    }),
              ),
              Container(
                child: MaterialButton(
                  child: Text("create Account New User"),
                    color: Colors.blue,
                    
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/registration',
                        arguments: "hello from register page",
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}