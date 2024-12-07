import 'package:flutter/material.dart';
import '../core/contants.dart';
import '../widgets/bottom_menu.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaPlanRengim ,
      body: Center(
        child: Text("Ses Ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
