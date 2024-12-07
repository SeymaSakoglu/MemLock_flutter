import 'package:flutter/material.dart';
import '../core/contants.dart';
import '../widgets/bottom_menu.dart';

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaPlanRengim ,
      body: Center(
        child: Text("Anilar Ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
