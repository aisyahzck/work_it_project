import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  //final User user;
  final String userEmail;
  final bool useTouchId;

  HomePage({@required this.userEmail, @required this.useTouchId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocalAuthentication auth = LocalAuthentication();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    authenticate();
  }

  void authenticate() async {
    final canCheck = await auth.canCheckBiometrics;

    if (canCheck) {
      List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();

     if (availableBiometrics.contains(BiometricType.fingerprint)) {
       // touch ID
     }

    }
    else {
      print('cannot check');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
            // Text('Welcome, $userName'),
            RaisedButton(
              onPressed: () {},
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
