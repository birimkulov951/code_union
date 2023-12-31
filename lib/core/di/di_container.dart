import 'package:code_union/core/di/di_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

/// flutter packages pub run build_runner build --delete-conflicting-outputs
@InjectableInit()
Future<void> initDi() async {
  getIt.init();
  return getIt.allReady();
}
