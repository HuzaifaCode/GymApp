
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/utils/toastMessages.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices{

  final _auth=FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  signInWithGoogle()async{
    final GoogleSignInAccount?  gUser=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication  gAuth= await gUser!.authentication;
    final credentials =GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }
  void uploadImage({required String imageUrl,
    required String title,
    required String description,
    required BuildContext context,
  }) async {
    // Authentication
    // SharedPreferences
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('email', imageUrl.toString());

    // Data Store in Cloud Firestore
    if (_auth.currentUser != null) {
      await _firestore.collection('products').doc(_auth.currentUser!.uid).set({
        "image": imageUrl.toString(),
        "title":title.toString(),
        "description": description.toString(),
      });
      showSnackBar("Data Saved", context);
    } else {
      print("User is not authenticated. Cannot upload image.");
    }

  }
}