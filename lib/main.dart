import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:roast_koff_management/features/home/presentation/screen/home_screen.dart';
import 'package:roast_koff_management/features/stock/presentation/screen/add_stock_screen.dart';

import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecase/login_usecase.dart';
import 'features/auth/presentation/screen/login_screen.dart';
import 'features/auth/presentation/screen/login_viewmodel.dart';
import 'features/home/presentation/screen/menu_provider.dart';
import 'features/stock/provider/stock_table_viewmodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await dotenv.load(fileName: ".env.web");
  } else if (Platform.isAndroid) {
    await dotenv.load(fileName: ".env.android");
  } else if (Platform.isIOS) {
    await dotenv.load(fileName: ".env.ios");
  } else if (Platform.isMacOS) {
    await dotenv.load(fileName: ".env.macos");
  } else if (Platform.isWindows) {
    await dotenv.load(fileName: ".env.windows");
  } else {}
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authRepository = AuthRepositoryImpl(FirebaseAuth.instance);
  final loginUseCase = LoginUseCase(authRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel(loginUseCase)),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => StockTableViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roast Koff Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/add-stock': (context) => const AddStockScreen(),
      },
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/login');
      }
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
