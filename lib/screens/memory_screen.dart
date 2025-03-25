import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors["surface"] ,
      body: const Center(
        child: Text("Anilar Ekranim"),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
