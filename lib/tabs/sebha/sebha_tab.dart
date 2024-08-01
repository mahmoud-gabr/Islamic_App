import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  List<String> tasbeh = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            Provider.of<SettingsProvider>(context).sebhaImages[0],
          ),
          GestureDetector(
            onTap: onTab,
            child: Transform.rotate(
              angle: angle * 3.141592653589793 / 180,
              child: Image.asset(
                Provider.of<SettingsProvider>(context).sebhaImages[1],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.tasbehatCounter,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.navyBlue
                  : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 16,
            ),
            height: 51,
            decoration: BoxDecoration(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.gold
                  : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: tasbehPrint(),
          ),
        ],
      ),
    );
  }

  onTab() {
    angle += 10;

    setState(() {});
  }

  Text tasbehPrint() {
    if (counter <= 33) {
      counter++;
      return Text(
        tasbeh[0],
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.black
                  : AppTheme.white,
            ),
      );
    } else if (counter <= 66) {
      counter++;
      return Text(
        tasbeh[1],
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.black
                  : AppTheme.white,
            ),
      );
    } else if (counter < 99) {
      counter++;
      return Text(
        tasbeh[2],
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.black
                  : AppTheme.white,
            ),
      );
    } else if (counter == 99) {
      counter = 0;
      return Text(
        tasbeh[2],
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.black
                  : AppTheme.white,
            ),
      );
    } else {
      counter = 0;
      angle = 0;
      return Text(
        tasbeh[0],
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Provider.of<SettingsProvider>(context).isDark
                  ? AppTheme.black
                  : AppTheme.white,
            ),
      );
    }
  }
}
