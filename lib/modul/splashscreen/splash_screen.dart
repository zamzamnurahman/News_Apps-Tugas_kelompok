import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_apps/models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = User.dummy();
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  splashcreenTime() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      }),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () => GoRouter.of(context).goNamed("home", extra: user),
    );
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    splashcreenTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: AnimatedCrossFade(
          crossFadeState: _crossFadeState,
          sizeCurve: Curves.easeInCirc,
          duration: const Duration(seconds: 1),
          firstChild: const Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          secondChild: const FlutterLogo(
            size: 100,
          ),
        ),
      )),
    );
  }
}
