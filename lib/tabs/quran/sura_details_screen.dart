import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura-details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late SuraDetailesArgs args;
  @override
  Widget build(BuildContext context) {
    loadSuraFile();
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailesArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }

    return SafeArea(
      child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Provider.of<SettingsProvider>(context).backgroundImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('سورة ${args.suraName}'),
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .08,
              horizontal: MediaQuery.of(context).size.width * .07,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.white,
            ),
            child: ayat.isEmpty
                ? const LoadingIndicator()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(
                          '( ${index + 1} ) ${ayat[index]}',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                    itemCount: ayat.length),
          ),
        ),
      ),
    );
  }

  void loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/files/${args.index + 1}.txt');
    ayat = sura.trim().split('\n');
    setState(() {});
  }
}
