import 'package:flutter/material.dart';
import 'package:muslim_app/screens/home/home_screen.dart';
import 'package:muslim_app/shared/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });

    // Mendapatkan nilai latar belakang dari SettingsProvider
    var settingsProvider = Provider.of<SettingsProvider>(context);
    String backgroundImage = settingsProvider.getBackgroundImage();

    return Scaffold(
      // Mengatur latar belakang dengan gambar dari SettingsProvider
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/quran.png'), // Ganti path dengan lokasi gambar Anda
        ),
      ),
    );
  }
}
