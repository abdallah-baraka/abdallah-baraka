import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Color icon_color = Color(0xFF00156b);
  Color entery_color = Color(0xFF2f64a8);
  bool value0 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFF1752e8),
                Colors.indigoAccent,
                Color(0xFFf0a3a3),
              ]),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * .56,
                height: MediaQuery.of(context).size.height * .005,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .45),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade900,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xFF1752e8),
                          Color(0xFF1752e8),
                          Colors.indigoAccent,
                          Colors.indigoAccent,
                          Color(0xFFf0a3a3),
                        ]))),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white38,
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .45,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .078,
                        left: MediaQuery.of(context).size.width * .065,
                        right: MediaQuery.of(context).size.width * .065),
                    color: icon_color,
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: entery_color,
                          hintText: "Email ID",
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize:
                                  MediaQuery.of(context).size.width * .05),
                          icon: Icon(
                            Icons.person,
                            size: MediaQuery.of(context).size.width * .09,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .018,
                        left: MediaQuery.of(context).size.width * .065,
                        right: MediaQuery.of(context).size.width * .065),
                    color: icon_color,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: entery_color,
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize:
                                  MediaQuery.of(context).size.width * .05),
                          icon: Icon(
                            Icons.lock_outline,
                            size: MediaQuery.of(context).size.width * .09,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .018,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: icon_color,
                            value: value0,
                            onChanged: (val) {
                              setState(() {
                                value0 = !value0;
                              });
                            }),
                        Text(
                          "Remember me",
                          style: TextStyle(
                              color: icon_color,
                              fontSize:
                                  MediaQuery.of(context).size.width * .032),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .036),
                          child: TextButton(
                            onPressed: () {
                              print("forget password");
                            },
                            child: Text(
                              "Forget Password ??",
                              style: TextStyle(
                                  color: icon_color,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .024),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .19),
              child: CircleAvatar(
                backgroundColor: icon_color,
                radius: MediaQuery.of(context).size.width * .13,
                child: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * .16,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              width: MediaQuery.of(context).size.width * .56,
              height: MediaQuery.of(context).size.height * .07,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .52),
              child: InkWell(
                onTap: () {
                  print("object");
                },
                child: Center(
                    child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * .056,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
