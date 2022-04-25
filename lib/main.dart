import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/theme_providers.dart';
import 'ui/pages/counter_page.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/theme_demo_page.dart';
import 'utils/app_const.dart';

void main() {
  runApp(
    // Wrap your app with a Riverpod ProviderScope.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// We are using a Consumer Widget to access the Riverpod providers we
// use to control the used light and dark themes, as well as mode.
//
// If your app is using a StatefulWidget then you can use StatefulConsumerWidget
// instead, and ConsumerState<T> instead of State<T>.
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConst.appName,
      // The light theme depends on lightThemeProvider's state.
      theme: ref.watch(lightThemeProvider),
      // The dark theme depends on darkThemeProvider's state.
      darkTheme: ref.watch(darkThemeProvider),
      // Currently used theme mode depends on themeModeProvider's state.
      themeMode: ref.watch(themeModeProvider),
      // Starting page using named routes.
      initialRoute: CounterPage.route,
      // Named routes and their page builders.
      routes: <String, WidgetBuilder>{
        SplashPage.route: (BuildContext context) => const SplashPage(),
        ThemeDemoPage.route: (BuildContext context) => const ThemeDemoPage(),
        CounterPage.route: (BuildContext context) => const CounterPage(),
      },
    );
  }
}
