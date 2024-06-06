import 'package:flutter/material.dart';
import 'package:weatherapp/home.dart';
import 'package:weatherapp/intro.dart';
import 'package:weatherapp/model/tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<List<String>>(
          future: getCurrentCity(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Intro(); // or any other loading indicator
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Assuming getCurrentCity returns a list with at least one element
              String city = snapshot.data![0];
              return HomeScreen(city: city);
            }
          },
        ));
  }
}
