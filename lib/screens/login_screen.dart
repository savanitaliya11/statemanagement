// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:statemanagement/componant/constant.dart';
import 'package:statemanagement/screens/product_overview_screen.dart';
import 'package:statemanagement/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass = TextEditingController();

  Future loginUser(String email, String password) async {
    var loginBody = {
      'username': email,
      'password': password,
    };

    http.Response response = await http.post(
        Uri.parse('https://codelineinfotech.com/student_api/User/login.php'),
        body: loginBody);
    var result = jsonDecode(response.body);
    if (result['message'] == 'Successfully Login!') {
      return result['message'];
    } else {
      return null;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 130),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login Now', style: loginlabelTextStyle),
                        Text(
                          'Please Login to continue using this app',
                          style: loginlabelTextStyle.copyWith(
                              color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Lottie.asset('assets/login.json'),
                  SizedBox(
                    height: 30,
                  ),
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
                              controller: _email,
                              decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: usernamelabel),
                            ),
                            SizedBox(
                              height: 15,
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
                                  hintText: 'Password',
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
                          var result = await loginUser(_email.text, _pass.text);
                          if (result == 'Successfully Login!') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    content: Text('LogIn Successfull')))
                                .closed
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductOverViewScreen())));
                          } else {
                            //Error
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please Enter Valid Data'),
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Form-State Error')));
                        }
                      },
                      child: Text(
                        'LogIn',
                        style: registerlabelTextStyle.copyWith(
                            color: Colors.white),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: loginlabelTextStyle.copyWith(
                            color: Colors.grey, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        child: Text('Register', style: registerlabelTextStyle),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Login USer',
        style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}
