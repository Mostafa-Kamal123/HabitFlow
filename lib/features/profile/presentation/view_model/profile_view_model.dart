import 'package:flutter/material.dart';
import 'package:habit_flow/features/profile/data/models/user_model.dart';
import 'package:habit_flow/features/profile/data/repository/user_repository.dart';

class ProfileViewModel extends ChangeNotifier {

  final UserRepository repo =
      UserRepository();

  UserModel? user;

  void loadUser() {

    user = repo.getUser();

    notifyListeners();
  }

  void saveUser({
    required String name,
    required String avatar,
  }) {

    final newUser = UserModel(
      name: name,
      avatar: avatar,
    );

    repo.saveUser(newUser);

    user = newUser;

    notifyListeners();
  }
}