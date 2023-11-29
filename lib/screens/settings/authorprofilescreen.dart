import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muslim_app/shared/providers/settings_provider.dart';
import 'package:muslim_app/shared/style/theme.dart';

class AuthorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Author Profile',
        style: TextStyle(
        color: settingsProvider.isDarkMode() ? Colors.white : Colors.black,
        ),
        ),

      ),
      backgroundColor: settingsProvider.isDarkMode()
          ? ThemeApp.darkPrimary
          : ThemeApp.lightPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              // Gambar profil mahasiswa
            ),
            SizedBox(height: 20.0),
            Text(
              'Nama: Disti Diahning Ayuwangi', // Ganti dengan nama mahasiswa
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: settingsProvider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Jurusan: Teknik Komputer', // Ganti dengan jurusan mahasiswa
              style: TextStyle(
                fontSize: 16.0,
                color: settingsProvider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'NIM: 21120121120011', // Ganti dengan NIM mahasiswa
              style: TextStyle(
                fontSize: 16.0,
                color: settingsProvider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Universitas Diponegoro', // Ganti dengan nama universitas mahasiswa
              style: TextStyle(
                fontSize: 16.0,
                color: settingsProvider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
