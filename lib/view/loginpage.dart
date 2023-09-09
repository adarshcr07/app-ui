//import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_ui/authentication.dart';
import 'package:first_app_ui/services/loginpageprovider.dart';
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
      body: Consumer<LoginpageProvider>(builder: (context, value, child) {
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
                //error causing widget
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return value.SignInButton(context); //sign in code
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
