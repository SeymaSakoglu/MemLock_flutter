// ana ekran

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/suggested_action_card.dart';
import 'setting_scree.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: const Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Arama Geçmişi'),
              onTap: () => context.push("/search"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () => context.push("/profile"),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () => context.push("/settings"),
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış Yap'),
              onTap: () => context.go("/login"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DotLottieLoader.fromAsset(
                    "assets/motions/q2.lottie",
                    frameBuilder: (context, dotlottie) {
                      if (dotlottie != null) {
                        return Lottie.memory(
                          dotlottie.animations.values.single,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    SuggestedActionCard(
                      icon: Icons.chat,
                      title: "Sohbet Başlat",
                      subtitle: "Yapay zeka ile sohbet edin",
                      onTap: () => context.push("/chat"),
                    ),
                    const SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.history,
                      title: "Son Aramalar",
                      subtitle: "Geçmiş aramalarınızı görüntüleyin",
                      onTap: () => context.push("/search"),
                    ),
                    const SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.settings,
                      title: "Ayarlar",
                      subtitle: "Uygulama ayarlarını özelleştirin",
                      onTap: () => context.push("/settings"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}