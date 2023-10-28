import 'package:maison_service/common/widgets/bottom_bar.dart';
import 'package:maison_service/constants/global_variables.dart';
import 'package:maison_service/features/admin/screens/admin_screen.dart';
import 'package:maison_service/features/auth/screens/auth_screen.dart';
import 'package:maison_service/features/auth/services/auth_service.dart';
import 'package:maison_service/features/home/screens/home_screen.dart';
import 'package:maison_service/providers/user_provider.dart';
import 'package:maison_service/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maison Service ',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: SplashScreen(
        authService: authService,
        onCompletion: () {
          return Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Provider.of<UserProvider>(context).user.type == 'user'
                  ? const BottomBar()
                  : const AdminScreen()
              : const AuthScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.authService,
    required this.onCompletion,
  }) : super(key: key);

  final AuthService authService;
  final Widget Function() onCompletion;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => widget.onCompletion(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/HOME SERVICE.png",
              height: 400,
              width: 400,
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              //valueColor: BlurStyle.normal,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
