import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_ui/authentication.dart';
import 'package:first_app_ui/view/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required User user})
      : udata = user,
        super(key: key);
  final User udata;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late User udata;

  bool Signout = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 320,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(64, 81, 233, 0.904),
                      Color.fromRGBO(99, 152, 187, 1),
                      Color.fromRGBO(66, 126, 175, 1),
                    ]),
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Main Wallet",
                      style: GoogleFonts.barlowSemiCondensed(
                        textStyle: TextStyle(
                          fontSize: 35,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("YOUR BALANACE",
                        style: GoogleFonts.barlow(
                            textStyle: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(199, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                        ))),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      r"$56,919.95",
                      key: ValueKey("my_text"),
                      style: GoogleFonts.barlowCondensed(
                          textStyle: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 37,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 18,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //on tapp
                            },
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.black,
                            ),
                            label: Text(
                              "SEND",
                              style: GoogleFonts.dosis(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 15,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //on tap
                            },
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.black,
                            ),
                            label: Text(
                              "RECIEVE",
                              style: GoogleFonts.dosis(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: Text('Prize Options'),
                  labelPadding: EdgeInsets.all(7),
                  backgroundColor: Color.fromARGB(188, 123, 59, 233),
                  labelStyle: GoogleFonts.openSansCondensed(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                Chip(
                  label: Text('Wallet Connections'),
                  labelPadding: EdgeInsets.all(7),
                  backgroundColor: Color.fromARGB(188, 123, 59, 233),
                  labelStyle: GoogleFonts.openSansCondensed(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                Chip(
                  label: Text('Manage Tokens'),
                  labelPadding: EdgeInsets.all(7),
                  backgroundColor: Color.fromARGB(188, 123, 59, 233),
                  labelStyle: GoogleFonts.openSansCondensed(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 23, 23),
                  borderRadius: BorderRadius.circular(25)),
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Color.fromRGBO(148, 115, 254, 100),
                      borderRadius: BorderRadius.circular(25)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.redAccent,
                  labelPadding: EdgeInsets.all(3),
                  labelStyle: GoogleFonts.barlow(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
                  tabs: [
                    Tab(
                      text: 'Tokens',
                    ),
                    Tab(
                      text: 'NFTs',
                    )
                  ]),
            ),
            Padding(padding: EdgeInsets.only(top: 0)),
            Expanded(
                child: TabBarView(children: [
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 8, right: 8, bottom: 11),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Color.fromARGB(255, 49, 49, 49)
                                  .withOpacity(1),
                              blurRadius: 50,
                              spreadRadius: 50,
                              offset: Offset(0, 50))
                        ],
                        borderRadius: BorderRadius.circular(18),
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                      height: MediaQuery.of(context).size.height / 11,
                      width: MediaQuery.of(context).size.width / 11,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/dive logo.jpg'),
                              radius: 28,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  'Dive wallet Token',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text('+5.87',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      color: Color.fromARGB(255, 48, 194, 11),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                    ))),
                              )
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 1),
                                child: Text(
                                  '1440.00DWT',
                                  style: GoogleFonts.robotoCondensed(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 1),
                                child: Text(
                                  r'-$87582',
                                  key: ValueKey("my_text"),
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromARGB(212, 255, 55, 55),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              Container(
                child: Icon(
                  Icons.add_reaction,
                  color: Colors.red,
                  size: 60,
                ),
              )
            ]))
          ],
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0.0,
          actions: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    weight: 3,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                        side: BorderSide(
                      width: 2,
                      color: Colors.white,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    )),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              /*const UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 114, 210, 255)),
                accountName: null,
                accountEmail: Text(' ${udata.email!} '),
                //here the userprofile image icon and name as text
              ),*/
              ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  "Account details",
                  style: GoogleFonts.barlow(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_sharp, color: Colors.black),
                title: Text(
                  "Data & Privacy",
                  style: GoogleFonts.barlow(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Signout
                  ? CircularProgressIndicator()
                  : ListTile(
                      onTap: () async {
                        setState(() {
                          Signout = true;
                        });

                        await Authentication.signOut(context: context);

                        setState(() {
                          Signout = false;
                        });

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Loginpage()));
                      },
                      title: Text(
                        "Sign out",
                        style: GoogleFonts.barlow(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                      ),
                    )
            ],
          ),
        ),
        bottomNavigationBar: _createBottomNavigationBar(),
      ),
    );
  }

  Widget _createBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 35, left: 16, right: 16),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 20,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 18,
                blurRadius: 18,
                offset: Offset(5, 0), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: AssetImage('images/gradiant.jpg'),
              fit: BoxFit.fill,
            )),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/compass.png'),
              ),
              label: 'World',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/wallet.png')),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/transaction.png')),
                label: 'Transaction'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/setting.png')),
                label: 'Setting')
          ],
        ),
      ),
    );
  }
}
