import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_flow/core/controllers/theme_controller.dart';
import 'package:habit_flow/features/profile/presentation/view_model/profile_view_model.dart';
import 'package:habit_flow/features/profile/presentation/views/widgets/aboutSection.dart';
import 'package:habit_flow/features/profile/presentation/views/widgets/perference.dart';
import 'package:habit_flow/features/profile/presentation/views/widgets/profilecard.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileViewModel vm;
TextEditingController nameController =
    TextEditingController();
  late ThemeController themeController;
  String name = "UserName";
  String selectedAvatar = "assets/avatars/avatar_1.jpg";

  bool notifications = true;

  final List<String> avatars = [
    "assets/avatars/avatar_1.jpg",
    "assets/avatars/avatar_2.jpg",
    "assets/avatars/avatar_3.jpg",
    "assets/avatars/avatar_4.jpg",
    "assets/avatars/avatar_5.jpg",
    "assets/avatars/avatar_6.jpg",
    "assets/avatars/avatar_7.jpg",
    "assets/avatars/avatar_8.jpg",
  
  ];

  @override
  void initState() {
    
    super.initState();
    vm = ProfileViewModel();

  vm.loadUser();

  if (vm.user != null) {
    name = vm.user!.name;

    selectedAvatar = vm.user!.avatar;

    nameController.text = vm.user!.name;

    
  }
    try {
      themeController = Get.find<ThemeController>();
    } catch (e) {
      themeController = Get.put(ThemeController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(child: Text("Profile",style: TextStyle(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
              Profilecard(
                selectedAvatar: selectedAvatar, name: name, avatars: avatars,
                onAvatarChanged: (val) {
                  setState(() {
                    selectedAvatar = val;
                  });
                },
                onNameChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                onSave: () {
                  vm.saveUser(
                    name: name,
                    avatar: selectedAvatar,
                  );
                },
              ),
              
              Perference(themeController: themeController, notifications: notifications),
              Aboutsection(),
            ],
          ),
        ),
      ),
    );
  }
}
