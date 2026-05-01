import 'package:habit_flow/features/addHabit/data/models/habit_model.dart';
import 'package:habit_flow/features/profile/data/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {

  static Future<void> init() async {

    await Hive.initFlutter();

    Hive.registerAdapter(HabitModelAdapter());
    Hive.registerAdapter(UserModelAdapter());

    await Hive.openBox<HabitModel>('habits');
    await Hive.openBox<UserModel>('user');

  }
}