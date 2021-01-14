import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_it_project/ui/home.dart';
import 'package:work_it_project/services/auth.dart';
import 'package:work_it_project/ui/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
        ),
      ],
        child: MaterialApp(
            title: 'Login',
            theme: new ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: AuthenticationWrapper()
        ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser =  context.watch<User>();

    if (firebaseUser != null){
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
