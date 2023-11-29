import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_app/model/hadith_details.dart';
import 'package:muslim_app/shared/adaptive/indicator.dart';
import 'package:muslim_app/shared/providers/settings_provider.dart';
import 'package:muslim_app/shared/style/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = 'HadithDetailsScreen';

  // Mendefinisikan fungsi getOs() yang digunakan di dalam HadithDetailsScreen
  String getOs() {
    // Tambahkan logika untuk mendapatkan sistem operasi di sini
    return 'Android'; // Contoh sederhana, sesuaikan dengan logika yang sesuai
  }

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    HadithDetailsArg argNames =
        (ModalRoute.of(context)?.settings.arguments) as HadithDetailsArg;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: GoogleFonts.elMessiri(),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: argNames.content.isEmpty
            ? Center(
                child: AdaptiveIndicator(
                  os: getOs(), // Panggil fungsi getOs() di sini
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  color: settingsProvider.isDarkMode()
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  elevation: 12,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 64)
                          .r,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text(
                            argNames.title,
                            style: GoogleFonts.elMessiri(
                              fontSize: 30.sp,
                              color: settingsProvider.isDarkMode()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 3.0.h,
                          color: settingsProvider.isDarkMode()
                              ? ThemeApp.yellow
                              : ThemeApp.lightPrimary,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12)
                              .r,
                          alignment: Alignment.center,
                          child: Text(
                            argNames.content,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: settingsProvider.isDarkMode()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
