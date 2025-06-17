import 'package:badminton_1/firebase_options.dart';
import 'package:badminton_1/src/data/repositories/auth_repository.dart';
import 'package:badminton_1/src/data/repositories/match_repository.dart';
import 'package:badminton_1/src/data/services/auth_service.dart';
import 'package:badminton_1/src/logic/observer/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badminton_1/src/logic/auth_bloc/auth_bloc.dart';
import 'package:badminton_1/src/presentation/screens/login_screen.dart';
import 'package:badminton_1/src/logic/match_bloc/match_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authService = AuthService();
  final authRepository = AuthRepository(authService);
  final matchRepository = MatchRepository();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: matchRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authRepository)..add(AuthStarted()),
          ),
          BlocProvider(
            create: (context) => MatchBloc(matchRepository),
          ),
        ],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badminton Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}
