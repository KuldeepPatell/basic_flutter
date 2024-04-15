import 'package:flutter/material.dart';
import 'package:myfirstproject/otp_verification_screen.dart';

// ignore: must_be_immutable
class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  final firstNameText = TextEditingController();
  final lastNameText = TextEditingController();
  final emailText = TextEditingController();
  var passText = TextEditingController();
  var addressText = TextEditingController();
  String state = 'State';
  String country = 'Country';
  List<String> stateList = <String>[
    'State',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    ''
  ];

  List<String> countryList = <String>['Country', 'India'];

  Widget statecustomdropdown(String input, List<String> list) {
    return DropdownButtonFormField<String>(
      onChanged: (String? newValue) {
        setState(() {
          state = newValue!;
          country = 'India';
        });
      },
      decoration: InputDecoration(labelText: 'State', hintText: 'State'),
      isExpanded: true,
      menuMaxHeight: 350,
      value: input,
      items: list.map<DropdownMenuItem<String>>(
        (value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text('$value',
                style:
                    TextStyle(color: const Color.fromARGB(255, 126, 123, 123))),
          );
        },
      ).toList(),
    );
  }

  Widget countrydropdown(String input, List<String> list) {
    return DropdownButtonFormField<String>(
      onChanged: (String? newValue) {
        setState(() {
          country = newValue!;
        });
      },
      decoration: InputDecoration(labelText: 'State', hintText: 'State'),
      isExpanded: true,
      menuMaxHeight: 350,
      value: input,
      items: list.map<DropdownMenuItem<String>>(
        (value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style:
                    TextStyle(color: const Color.fromARGB(255, 126, 123, 123))),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.close_sharp)),
                InkWell(
                    onTap: () {},
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Customer",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: firstNameText,
                    decoration: InputDecoration(
                        hintText: 'First Name', labelText: 'First Name'),
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
                    height: 2,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: lastNameText,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
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
                    height: 2,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailText,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
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
                    height: 2,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passText,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
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
                    height: 2,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: addressText,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: screenWidth * .40,
                          child: statecustomdropdown(state, stateList)),
                      Container(
                        width: screenWidth * .40,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Postcode',
                            labelText: 'Postcode',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Postcode is required';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ],
                  ),
                  countrydropdown(country, countryList),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    )
                  ]),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 70, 62),
                      shape: BeveledRectangleBorder(),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpVerification(
                                    emailText.text.toString())));
                      }
                    },
                    child: const Text('Create account',
                        style: TextStyle(color: Colors.white)),
                  ),
                )),
            SizedBox(
              height: 35,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Terms of Use and Privacy Policy',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ))
          ]),
        ),
      ),
    ));
  }
}
