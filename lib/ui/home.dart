import 'package:work_it_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_it_project/ui/login_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
            RaisedButton(
              onPressed: () {
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
