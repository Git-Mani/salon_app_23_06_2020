import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthService{
  FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }


  Future <String> LoginWithGoogle () async {

    try {

      GoogleSignInAccount account = await  _googleSignIn.signIn();

      AuthResult result= await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: (await account.authentication).idToken,
          accessToken: (await account.authentication).accessToken
      ));
      final FirebaseUser fuser = result.user;
      assert(!fuser.isAnonymous);
      assert(await fuser.getIdToken() != null);
      return "$fuser";


    }catch(e){
      print("errorr login with google");
      return null;

    }

  }



}
final
AuthService authService=AuthService();