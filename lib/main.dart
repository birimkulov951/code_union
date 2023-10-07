import 'package:code_union/app/code_union_app.dart';
import 'package:code_union/core/di/di_container.dart';
import 'package:code_union_localization/strings.g.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  runApp(
    TranslationProvider(
      child: const CodeUnionApp(),
    ),
  );
}
