import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/radio/radio_tab.dart';
import 'package:islami_app/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = const [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Provider.of<SettingsProvider>(context).backgroundImagePath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title:  Text(AppLocalizations.of(context)!.islami),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items:  [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_quran.png'),
                ),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png'),
                ),
                label:  AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_sebha.png'),
                ),
                label:  AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_radio.png'),
                ),
                label:  AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label:  AppLocalizations.of(context)!.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
