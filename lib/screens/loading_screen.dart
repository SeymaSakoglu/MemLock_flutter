//acilis ekranimiz buraya gelecek
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../core/contants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaPlanRengim ,
      body: SizedBox.expand(
        //width: double.infinity,
        child: Column(
          children: [
            // Logo bölümü
            Expanded(
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Yükleme ikonu
            //CircularProgressIndicator(),

            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 300,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/loading.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),

            //bosluk bırakmak lazım :)
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
