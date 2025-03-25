import 'package:flutter/material.dart';
import 'package:memlock_flutter/widgets/bottom_menu.dart';

import '../core/constants.dart';
import '../core/themes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors["surface"] ,
      body: const Center(
        child: Text("Arama Ekranim"),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}