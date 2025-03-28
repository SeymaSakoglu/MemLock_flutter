import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                floating: true,
                pinned: true,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                title: Text(
                  "Akıllı Asistan",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Icon(Icons.assistant,
                                    size: 32,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  "Merhaba! Size nasıl yardımcı olabilirim?",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Hızlı İşlemler",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.5,
                        children: [
                          ActionCard(
                            icon: Icons.person,
                            title: "Profil",
                            color: Theme.of(context).colorScheme.primary,
                            onTap: () => context.push("/profile"),
                          ),
                          ActionCard(
                            icon: Icons.login,
                            title: "Giriş Yap",
                            color: Theme.of(context).colorScheme.secondary,
                            onTap: () => context.push("/login"),
                          ),
                          ActionCard(
                            icon: Icons.app_registration,
                            title: "Kayıt Ol",
                            color: Theme.of(context).colorScheme.tertiary,
                            onTap: () => context.go("/register"),
                          ),
                          ActionCard(
                            icon: Icons.delete,
                            title: "Hesabı Kaldır",
                            color: Theme.of(context).colorScheme.error,
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                icon: const Icon(Icons.warning),
                                title: const Text("Uyarı"),
                                content: const Text(
                                    "Hesabınızı silmek istediğinizden emin misiniz?"),
                                actions: [
                                  TextButton(
                                    onPressed: () => context.pop(),
                                    child: const Text("İptal"),
                                  ),
                                  FilledButton(
                                    onPressed: () {},
                                    child: const Text("Sil"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Bir şeyler sorun...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ActionCard({super.key, 
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: color, width: 4)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: color,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}