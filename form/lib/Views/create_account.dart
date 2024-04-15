import 'package:flutter/material.dart';
import 'package:form/JSON/users.dart';
import 'package:form/sql/database_helper.dart';
// import 'package:form/database_helper.dart';

import 'package:form/Views/log_in.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final mobileNumber = TextEditingController();
  final passText = TextEditingController();
  final passText2 = TextEditingController();
  final dateOfBirth = TextEditingController();
  var gender = '';
  var maritalStatus = '';
  final db = DatabaseHelper();
  signUp() async {
    var res = await db.createUser(Users(
        name: nameText.text, email: emailText.text, password: passText.text));
    if (res > 0) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogIn()));
      // Future.delayed(Duration(seconds: 5), () {
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => LogIn(),
      //       ));
      // });
    }
  }

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

  Widget genderRadio(String s1) {
    return Radio(
        value: s1,
        groupValue: gender,
        onChanged: (value) {
          setState(() {
            gender = value.toString();
          });
        });
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Create Account',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 26, 26, 26)),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 25, right: 25),
              height: 650,
              width: 350,
              color: Colors.black26,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameText,
                      decoration: InputDecoration(
                          border: border(),
                          focusedBorder: focusedBorder(),
                          hintText: 'Enter Your Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 83, 83, 83),
                          )),
                      validator: (value) {
                        String pattern = r'^[a-zA-Z\s]*$';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return 'Name is required';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid name';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailText,
                      decoration: InputDecoration(
                          border: border(),
                          focusedBorder: focusedBorder(),
                          hintText: 'Enter Your E-mail',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 83, 83, 83),
                          )),
                      validator: (value) {
                        String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid email address';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: mobileNumber,
                      decoration: InputDecoration(
                        border: border(),
                        focusedBorder: focusedBorder(),
                        hintText: 'Enter Your Number',
                        prefixIcon: const Icon(Icons.contact_phone,
                            color: Color.fromARGB(255, 83, 83, 83)),
                      ),
                      validator: (var value) {
                        // Regular expression to match a 10-digit Indian mobile number
                        String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty) {
                          return 'Mobile number is required';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passText,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: border(),
                        focusedBorder: focusedBorder(),
                        hintText: 'Create Your Paswword',
                        prefixIcon: const Icon(Icons.password,
                            color: Color.fromARGB(255, 83, 83, 83)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passText2,
                      decoration: InputDecoration(
                        border: border(),
                        focusedBorder: focusedBorder(),
                        hintText: 'Re-enter Your Paswword',
                        prefixIcon: const Icon(Icons.password,
                            color: Color.fromARGB(255, 83, 83, 83)),
                      ),
                      validator: (value) {
                        if (value != passText.text) {
                          return "Passwords does'nt match";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: dateOfBirth,
                      decoration: InputDecoration(
                        border: border(),
                        focusedBorder: focusedBorder(),
                        hintText: 'Enter Date of Birth',
                        suffixIcon: const Icon(Icons.calendar_today_rounded,
                            color: Color.fromARGB(255, 83, 83, 83)),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());

                        if (datePicked != null) {
                          setState(() {
                            dateOfBirth.text =
                                DateFormat('dd-MM-yyyy').format(datePicked);
                            // datePicked.toString().split(" ")[0];
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date of Birth is required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Gender:',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              genderRadio('Male'),
                              const Text(
                                'Male',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              genderRadio('Female'),
                              const Text(
                                'Female',
                              ),
                            ],
                          ),
                        ]),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 30,
                          shape: BeveledRectangleBorder(),
                        ),
                        onPressed: () async {
                          signUp();
                          // if (formKey.currentState!.validate()) {
                          //   formKey.currentState!.save();
                          // await DatabaseHelper.instance.insert({

                          // });
                          // showDialog(
                          //   context: context,
                          //   builder: (context) => AlertDialog(
                          //     title: Text(
                          //       'Thankyou ${nameText.text.toString()} \n Your account will be created soon... ',
                          //       style: TextStyle(fontSize: 20),
                          //     ),
                          //   ),
                          // );
                          // Future.delayed(Duration(seconds: 5), () {
                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => LogIn(),
                          //       ));
                          // });
                          // }
                        },
                        child: const Text('Submit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 14, 13, 13))),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
