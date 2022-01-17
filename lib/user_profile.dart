import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/users.dart';
import 'package:riverpod_demo/state/state_manager.dart';

class UserProfile extends StatelessWidget {
  Users? user;
  UserProfile({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name:  ${user!.results![0].name}',
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          Text('Email:  ${user!.results![0].name}',
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          Text('Company Name:  ${user!.results![0].name}',
              style: TextStyle(fontSize: 18))
        ],
      ),
    ));
  }
}
