import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';
import 'package:first_app/content_reciever.dart';
//import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const ContentReciever(
    
  ));
  // First app
  // runApp(
  //   const MaterialApp(
  //     home: Scaffold(
  //       body: GradientContainer("My App is here",
  //       colors: [
  //         Color.fromARGB(255, 1, 143, 223), 
  //         Color.fromARGB(255, 15, 57, 81)]),
  //     )
  //   ),
  // );
}

// With Flutter, you create user interfaces by combining "widgets"
// You'll learn all about them (and much more) throughout this course!
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Every custom widget must have a build() method
  // It tells Flutter, which widgets make up your custom widget
  // Again: You'll learn all about that throughout the course!
  @override
  Widget build(BuildContext context) {
    // Below, a bunch of built-in widgets are used (provided by Flutter)
    // They will be explained in the next sections
    // In this course, you will, of course, not just use them a lot but
    // also learn about many other widgets!
    return MaterialApp(
      title: 'Flutter First App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Flutter - The Complete Guide',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Learn Flutter step-by-step, from the ground up.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}