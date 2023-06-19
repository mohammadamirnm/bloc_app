import 'package:bloc_app/src/features/news/presentation/cubits/news/news_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/theme.dart';
import 'src/features/news/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<NewsCubit>(create: (_) => NewsCubit()),
        ],
        child: child ?? Container(),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const HomePage(),
    );
  }
}
