import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_demo/providers/theme_providers.dart';

class DarkColorsSwapSwitch extends ConsumerWidget {
  const DarkColorsSwapSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile.adaptive(
      title: const Text('Dark mode swap colors'),
      subtitle: const Text('Turn ON to swap primary and secondary colors'),
      value: ref.watch(darkSwapColorsProvider).state,
      onChanged: (bool value) {
        ref.read(darkSwapColorsProvider).state = value;
      },
    );
  }
}
