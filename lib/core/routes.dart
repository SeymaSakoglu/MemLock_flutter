//uygulamada sayfalari ve navigasyon islemlerini burada tanimlicaz
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memlock_flutter/screens/profile_screen.dart';
import 'package:memlock_flutter/screens/memory_screen.dart';
import 'package:memlock_flutter/screens/voice_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/memory_screen.dart';
import '../screens/voice_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/memory',
      builder: (context, state) => const MemoryScreen(),
    ),
    GoRoute(
      path: '/voice',
      builder: (context, state) => const VoiceScreen(),
    ),
  ],
);
