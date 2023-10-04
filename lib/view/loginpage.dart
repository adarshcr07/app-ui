//import 'package:firebase_auth/firebase_auth.dart';

import 'package:first_app_ui/model/authentication.dart';
import 'package:first_app_ui/view_model/loginpageprovider.dart';
//import 'package:first_app_ui/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  //bool _isSigningIn = false;

  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 187, 187, 187),
      //consumer here
      body: Consumer<LoginpageProvider>(builder: (context, indicator, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/game.png',
                          height: 200,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Flutter',
                      style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                              color: Color.fromARGB(218, 36, 73, 175))),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('LOGIN',
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                              color: Color.fromARGB(218, 36, 73, 175)),
                        ))
                  ],
                )),
                SizedBox(
                  height: 1,
                ),
                //Phonenumber fieald
                TextFormField(
                  controller: indicator.Numbercontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.phone_iphone,
                        color: Colors.cyan,
                      ),
                      hintStyle: new TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      hintText: "Enter Your Phone Number...",
                      fillColor: Colors.white70),
                ),
                SizedBox(
                  height: 20,
                ),
                //otp genarator
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 255, 255)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  onPressed: () {
                    indicator.phoneNumberAuthentication(
                        indicator.Numbercontroller.text, context);
                  },
                  child: Text(
                    "Generate OTP",
                    style: TextStyle(color: Color.fromARGB(255, 255, 81, 81)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //error causing widget
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot)

                      //pass the firebase user data here!
                      {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return indicator.SignInButton(context); //sign in code
                    }

                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                    );
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
