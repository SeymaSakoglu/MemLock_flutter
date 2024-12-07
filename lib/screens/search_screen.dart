import 'package:flutter/material.dart';
import 'package:memlock_flutter/widgets/bottom_menu.dart';

import '../core/contants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaPlanRengim ,
      body: Center(
        child: Text("Arama Ekranim"),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}