import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';
import 'package:islami_app/tabs/hadeth/hadeth_deatails_screen.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.of(context).size.height * .25,
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? const LoadingIndicator()
              : ListView.separated(
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 12,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: ahadeth.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        HadethDetailsScreen.routeName,
                        arguments: ahadeth[index],
                      );
                    },
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadethFileContent.split('#');
    ahadeth = ahadethText.map(
      (ahadethText) {
        List<String> hadethLines = ahadethText.trim().split('\n');
        String title = hadethLines.first;
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        return Hadeth(title: title, content: content);
      },
    ).toList();
    setState(() {});
  }
}
