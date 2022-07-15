import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_springboot/Register.dart';
import 'package:flutter_springboot/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://localhost:8080/login";
  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 750,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 65, 82, 1),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(1, 5))
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(88),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Login",
                            style: GoogleFonts.pacifico(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email",
                              style: GoogleFonts.roboto(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Color.fromRGBO(255, 255, 255, 0.8)),
                            ),
                          ),
                          TextFormField(
                            controller: TextEditingController(text: user.email),
                            onChanged: (val) {
                              user.email = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is Empty';
                              }
                              return '';
                            },
                            style: TextStyle(fontSize: 30, color: Colors.white),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontSize: 20, color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                          Container(
                            height: 8,
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style: GoogleFonts.roboto(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Color.fromRGBO(255, 255, 255, 0.8)),
                            ),
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: user.password),
                            onChanged: (val) {
                              user.password = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is Empty';
                              }
                              return '';
                            },
                            style: TextStyle(fontSize: 30, color: Colors.white),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontSize: 20, color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                          Container(
                            height: 8,
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: Text(
                                "Don't have Account ?",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 90,
                    width: 90,
                    child: FlatButton(
                      color: Color.fromRGBO(233, 65, 82, 1),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
