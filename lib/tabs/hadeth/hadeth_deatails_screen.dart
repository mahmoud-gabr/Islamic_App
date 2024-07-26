import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth-details';
  const HadethDetailsScreen({super.key});

  @override
Widget build(BuildContext context) {
   Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
            title: Text( hadeth.title),
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
            child: ListView.builder(
                    itemBuilder: (_, index) => Text(
                          hadeth.content[index],
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                    itemCount: hadeth.content.length),
          ),
        ),
      ),
    );
  }
}
