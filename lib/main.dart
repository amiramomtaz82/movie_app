import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/provider/language_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:movie_app/ui/presentaion/auth_cubit/cubit_auth.dart';
import 'package:movie_app/ui/presentaion/favorite_cubit/favorite_cubit.dart';
import 'package:movie_app/ui/presentaion/history_cubit/histor_cubit.dart';
import 'package:movie_app/ui/presentaion/lacal_cubit/local_cubit.dart';
import 'package:movie_app/ui/presentaion/lacal_cubit/local_state.dart';
import 'package:movie_app/ui/screens/Authentication/login_screen.dart';
import 'package:movie_app/ui/screens/bording/on_bording_screen.dart';
import 'package:movie_app/ui/screens/home/browes_tab/browes_tab.dart';
import 'package:movie_app/ui/screens/home/home_screen.dart';
import 'package:movie_app/ui/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'core/di/di.dart';
import 'data/dataSource_firebase_auth.dart';
import 'data/dataSource_firestore.dart';
import 'data/repos_auth_imp.dart';
import 'domain/reopsotries/repos_auth.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main()async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authDS = FirebaseAuthDataSource();
  final firestoreDS = FirestoreDataSource();

  initDependencies();

  final authRepository =
  AuthRepositoryImpl(authDS, firestoreDS);

  runApp(ChangeNotifierProvider(create: (_)=>ThemeProvider(),
    child: ChangeNotifierProvider(create:(_)=>LanguageProvider(),

        child: MyApp(authRepository: authRepository,firebaseAuthDataSource:authDS,) ),
  ));
}

class MyApp extends StatelessWidget {
  late LanguageProvider provider;
  late ThemeProvider theme;
  final AuthRepository authRepository;
  final FirebaseAuthDataSource firebaseAuthDataSource;


   MyApp({super.key,required this.authRepository,required this.firebaseAuthDataSource});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //  WebViewPlatform.instance = AndroidWebViewPlatform();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepository,firebaseAuthDataSource),
        ),
        BlocProvider<FavoriteCubit>(create: (_)=>getIt<FavoriteCubit>()),
        BlocProvider<HistoryCubit>(create: (_)=> getIt<HistoryCubit>(),),
        BlocProvider<LocaleCubit>(
          create: (_) => getIt<LocaleCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(   // ✅ IMPORTANT
        builder: (context, state)
    {
      Locale locale = const Locale('en');

      if (state is LocaleChanged) {
        locale = state.locale;
      }
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        locale: locale,

        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],

        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
    );
     } )
  );
  }
}
