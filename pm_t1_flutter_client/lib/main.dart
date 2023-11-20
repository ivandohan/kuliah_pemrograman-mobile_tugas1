import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pm_t1_flutter_client/constants/colors.dart';
import 'package:pm_t1_flutter_client/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StunningSplashScreen(),
    );
  }
}

class StunningSplashScreen extends StatefulWidget {
  const StunningSplashScreen({super.key});

  @override
  State<StunningSplashScreen> createState() => _StunningSplashScreenState();
}

class _StunningSplashScreenState extends State<StunningSplashScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomeScreen()
      ));
    });
  }
  
  
  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: CustomAppColorA2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.accessible_forward_outlined,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              "App Title",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


