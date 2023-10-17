import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_sample/screen/home/home.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      // Handle login errors
      print('Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("SINGIN"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your username";
                }
                return null;
              },
              controller: emailController,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                color: Colors.blueGrey,
              ),
              maxLines: 1,
              keyboardType: TextInputType.text,
              cursorColor: Colors.blueGrey,
              decoration: InputDecoration(
                hintText: 'Enter your UserName',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
                filled: true,
                fillColor: emailController.text.isEmpty
                    ? const Color.fromRGBO(248, 247, 251, 1)
                    : Colors.transparent,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: emailController.text.isEmpty
                          ? Colors.transparent
                          : Colors.blueGrey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    )),
                prefixIcon: Icon(
                  Icons.person,
                  color: emailController.text.isEmpty
                      ? Colors.blueGrey
                      : Colors.blueGrey,
                  size: 17,
                ),
                suffix: Container(
                  alignment: Alignment.center,
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blueGrey),
                  child: emailController.text.isEmpty
                      ? const Center()
                      : Icon(
                          Icons.check,
                          color: Colors.blueGrey,
                          size: 17,
                        ),
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your username";
                }
                return null;
              },
              controller: passController,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                color: Colors.blueGrey,
              ),
              maxLines: 1,
              keyboardType: TextInputType.text,
              cursorColor: Colors.blueGrey,
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
                filled: true,
                fillColor: passController.text.isEmpty
                    ? const Color.fromRGBO(248, 247, 251, 1)
                    : Colors.transparent,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: emailController.text.isEmpty
                          ? Colors.transparent
                          : Colors.blueGrey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    )),
                prefixIcon: Icon(
                  Icons.lock,
                  color: passController.text.isEmpty
                      ? Colors.blueGrey
                      : Colors.blueGrey,
                  size: 17,
                ),
                suffix: Container(
                  alignment: Alignment.center,
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blueGrey),
                  child: passController.text.isEmpty
                      ? const Center()
                      : Icon(
                          Icons.check,
                          color: Colors.blueGrey,
                          size: 17,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  _login();
                },
                child: Text("SignIn"))
          ],
        ),
      ),
    );
  }
}
