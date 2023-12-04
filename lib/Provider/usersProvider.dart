import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersDetail.dart';
import 'package:gamview/Service/DataControllerUsers.dart';

class UsersProviders extends ChangeNotifier {
  UsersDetail? _users;
  String? _username;

  UsersDetail? get users => _users;
  String? get username => _username; // Fix the getter

  Future<void> getUsers() async {
    _users = await Users().getID();
    _username = _users?.username;
    notifyListeners();
  }
}
