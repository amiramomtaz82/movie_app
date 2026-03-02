import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/provider/language_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:movie_app/ui/presentaion/cubit_auth.dart';
import 'package:movie_app/ui/screens/Authentication/login_screen.dart';
import 'package:movie_app/ui/screens/bording/on_bording_screen.dart';
import 'package:movie_app/ui/screens/home/home_screen.dart';
import 'package:movie_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'data/dataSource_firebase_auth.dart';
import 'data/dataSource_firestore.dart';
import 'data/repos_auth_imp.dart';
import 'domain/repos_auth.dart';
import 'firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authDS = FirebaseAuthDataSource();
  final firestoreDS = FirestoreDataSource();



  final authRepository =
  AuthRepositoryImpl(authDS, firestoreDS);
  runApp(ChangeNotifierProvider(create: (_)=>ThemeProvider(),
    child: ChangeNotifierProvider(create:(_)=>LanguageProvider(),

        child: MyApp(authRepository: authRepository,) ),
  ));
}

class MyApp extends StatelessWidget {
  late LanguageProvider provider;
  late ThemeProvider theme;
  final AuthRepository authRepository;

   MyApp({super.key,required this.authRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
