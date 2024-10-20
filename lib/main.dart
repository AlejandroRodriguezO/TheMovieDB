import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(initializeDependencies());
  unawaited(
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  );
  runApp(const MyApp());
}
