import 'package:rest_country/misc/color.dart';
import 'package:rest_country/controller/favourites_provider.dart';
import 'package:rest_country/view/screen/country_page.dart';
import 'package:rest_country/controller/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<CountryProvider>(
                  create: (context) => CountryProvider()),
                   ChangeNotifierProvider<FavouriteProvider>(
                  create: (context) => FavouriteProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              home: const CountryScreen(),
            )
          );
        });
  }
}
