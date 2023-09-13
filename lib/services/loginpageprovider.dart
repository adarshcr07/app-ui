//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_ui/authentication.dart';
import 'package:first_app_ui/view/homepage.dart';
import 'package:flutter/material.dart';

class LoginpageProvider extends ChangeNotifier {
  //for the google sign in
  bool _isSigningIn = false;

  SignInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  const Color.fromARGB(255, 255, 0, 0)),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                _isSigningIn = true;

                User? user =
                    await Authentication.signInWithGoogle(context: context);

                _isSigningIn = false;

                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyHomePage(user: user)));
                }
                notifyListeners();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/google.png'),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  //phonenumber login

  bool otpSignin = false;
  late String receivedID;
  late String authStatus;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController Numbercontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

  Future<void> phoneNumberAuthentication(
      String phoneNumber, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential authCredential) {
        authStatus = "Your account is successfully verified";
      },
      verificationFailed: (FirebaseAuthException error) {
        print(error.message);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("TIMEOUT");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        receivedID = verificationId;
        authStatus = "OTP has been successfully sent";
        showDialogBox(context);
      },
    );
  }

  showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your OTP'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: otpSignin
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        const Color.fromARGB(255, 255, 0, 0)),
                  )
                : Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter OTP';
                        } else if (value.length != 6) {
                          return 'OTP must be 6 digits';
                        }
                        return null; // Validation passed
                      },
                      controller: codecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  otpSignin = true;
                  notifyListeners();
                  await phoneSignIn(context);
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> phoneSignIn(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID, smsCode: codecontroller.text);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('OTP verified');
      otpSignin = false;

      // Navigate to the home page on successful verification
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyHomePage(user: user)));
      }
    } catch (e) {
      otpSignin = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid OTP'),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Tap to Clear the field',
            onPressed: () {
              //codecontroller.clear(); // Clear the text field
            },
          ),
        ),
      );
    }
  }
}
