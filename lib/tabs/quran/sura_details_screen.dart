import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura-details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

List<String> ayat = [];
late SuraDetailesArgs args;

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailesArgs;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
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
              color: AppTheme.white,
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
    ayat = sura.split('\n');
    setState(() {});
  }
}
