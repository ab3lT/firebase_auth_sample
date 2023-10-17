import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_sample/service/user_managment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserService userService = UserService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _handleSignOut() async {
    await userService.signOut();
    // Navigate to a login screen or another appropriate screen
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, ${user?.email}'),
            // Display user's profile data from Firestore here
          ],
        ),
      ),
    );
  }
}
