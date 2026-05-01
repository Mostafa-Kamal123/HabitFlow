import 'package:habit_flow/features/profile/data/models/user_model.dart';
import 'package:hive/hive.dart';

class UserRepository {

  final Box<UserModel> box =
      Hive.box<UserModel>('user');

  UserModel? getUser() {

    if (box.isEmpty) {
      return null;
    }

    return box.getAt(0);
  }

  void saveUser(UserModel user) {

    if (box.isEmpty) {
      box.add(user);
    } else {
      box.putAt(0, user);
    }
  }
}