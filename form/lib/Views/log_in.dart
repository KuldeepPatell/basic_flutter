import 'package:flutter/material.dart';
import 'package:form/JSON/users.dart';
import 'package:form/Views/create_account.dart';
import 'package:form/sql/database_helper.dart';
import 'package:form/Views/home.dart';
// import 'package:form/splash_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});
  @override
  State<LogIn> createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  final username = TextEditingController();
  final password = TextEditingController();
  var show = true;
  // static final String KEYusername = username.text.toString();
  // var nameValue = "";
  bool isLoginTrue = false;

  final db = DatabaseHelper();
  //Login Method
  // WE will take the value of text fields using controllers in order to verify whther details are correct or not
  login() async {
    var res = await db
        .authenticate(Users(email: username.text, password: password.text));
    if (res == true) {
      //  if result is correct then go to home
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getValue();
  // }

  // void getValue() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var getName = prefs.getString(KEYusername);
  //   username = (getName ?? "") as TextEditingController;
  //   setState(() {});
  // }

  border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color.fromARGB(255, 15, 14, 14)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login_image.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 500,
                width: 350,
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
                  child: Column(children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: username,
                      decoration: InputDecoration(
                          border: border(),
                          focusedBorder: focusedBorder(),
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: password,
                      obscureText: show,
                      decoration: InputDecoration(
                          border: border(),
                          focusedBorder: focusedBorder(),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              show ? Icons.visibility_off : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                show = !show;
                              });
                            },
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: 125,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 30,
                          shape: BeveledRectangleBorder(),
                        ),
                        onPressed: () {
                          // var prefs = await SharedPreferences.getInstance();
                          // prefs.setString(
                          //     KEYusername, username.text.toString());
                          // prefs.setBool(SplashScreenState.KEYLOG, true);
                          login();
                          print("tap");

                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Home(),
                          //     ));
                          // print(
                          //     'Email: ${username.text.toString()}, Password: ${password.text.toString()}');
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "  Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                          },
                          child: const Text('SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    isLoginTrue
                        ? Text(
                            "Username or password is incorrect",
                            style: TextStyle(color: Colors.red.shade900),
                          )
                        : const SizedBox(),
                  ]),
                ),
              ),
            ),
          )),
    );
  }
}
