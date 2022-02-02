// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:statemanagement/componant/constant.dart';
import 'package:statemanagement/screens/login_screen.dart';
import 'package:statemanagement/screens/product_overview_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _uname = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future registerUser(String? firstname, String? lastname, String? username,
      String? password) async {
    var regBody = {
      'first_name': firstname,
      'last_name': lastname,
      'username': username,
      'password': password,
    };
    http.Response response = await http.post(
        Uri.parse('https://codelineinfotech.com/student_api/User/signup.php'),
        body: regBody);

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/registration.json',
                        height: 70, width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Register User', style: loginlabelTextStyle),
                        Text(
                          'If you are new User Please Register',
                          style: loginlabelTextStyle.copyWith(
                              color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Lottie.asset('assets/swipe-for-shopping.json'),
                Form(
                  key: _formKey,
                  child: Card(
                    color: Colors.white,
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },
                            controller: _fname,
                            decoration: InputDecoration(
                                hintText: 'First Name',
                                hintStyle: usernamelabel),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },
                            controller: _lname,
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                hintStyle: usernamelabel),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },
                            controller: _uname,
                            decoration: InputDecoration(
                                hintText: ' UserName',
                                hintStyle: usernamelabel),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },
                            controller: _pass,
                            decoration: InputDecoration(
                                hintText: 'Password', hintStyle: usernamelabel),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'UploadImage',
                                hintStyle: usernamelabel),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var result = await registerUser(
                            _fname.text, _lname.text, _uname.text, _pass.text);
                        log('RESULT==========${result}');
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text("Successfully Signup!")))
                            .closed
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductOverViewScreen())));
                        _fname.clear();
                        _lname.clear();
                        _uname.clear();
                        _pass.clear();
                      } else {
                        print('Data Not Found');
                      }
                    },
                    child: Text(
                      'Register',
                      style:
                          registerlabelTextStyle.copyWith(color: Colors.white),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you are existing user!',
                      style: loginlabelTextStyle.copyWith(
                          color: Colors.grey, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('Login', style: registerlabelTextStyle),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Register USer',
        style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}
