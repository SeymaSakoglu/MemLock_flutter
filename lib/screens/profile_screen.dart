import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors["surface"] ,
      body: const Center(
        child: Text("Profil Ekranim"),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
