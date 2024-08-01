import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        const SizedBox(
          height: 57,
        ),
        Text(
          AppLocalizations.of(context)!.radioSration,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Provider.of<SettingsProvider>(context).isDark
                    ? AppTheme.white
                    : AppTheme.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(
          height: 57,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous_rounded,
                color: Provider.of<SettingsProvider>(context).isDark
                    ? AppTheme.gold
                    : Theme.of(context).primaryColor,
                size: 64,
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_rounded,
                color: Provider.of<SettingsProvider>(context).isDark
                    ? AppTheme.gold
                    : Theme.of(context).primaryColor,
                size: 64,
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next_rounded,
                color: Provider.of<SettingsProvider>(context).isDark
                    ? AppTheme.gold
                    : Theme.of(context).primaryColor,
                size: 64,
              ),
            ),
          ],
        )
      ],
    );
  }
}
