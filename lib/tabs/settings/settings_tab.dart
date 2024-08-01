import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.darkMode,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (isDark) {
                  settingsProvider
                      .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                },
                activeTrackColor: AppTheme.gold,
                inactiveTrackColor: Theme.of(context).primaryColor,
                thumbColor: const MaterialStatePropertyAll(AppTheme.white),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: settingsProvider.language,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        'English',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        'العربية',
                        style:
                            Theme.of(context).textTheme.titleLarge!.copyWith(),
                      ),
                    ),
                  ],
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage == null) return;
                    settingsProvider.changLanguge(selectedLanguage);
                  },
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
