import 'package:code_union/app/navigation/app_router_config.dart';
import 'package:code_union_localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CodeUnionApp extends StatefulWidget {
  const CodeUnionApp({super.key});

  @override
  State<CodeUnionApp> createState() => _CodeUnionAppState();
}

class _CodeUnionAppState extends State<CodeUnionApp> {
  final _appRouterConfig = AppRouterConfig();

  @override
  void dispose() {
    _appRouterConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouterConfig.router,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
