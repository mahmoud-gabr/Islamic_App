import 'package:flutter/material.dart';

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
          'إذاعة القرأن الكريم',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
                size: 64,
              ),
            ),
          ],
        )
      ],
    );
  }
}
