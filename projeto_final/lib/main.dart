import 'package:flutter/material.dart';
import 'package:projeto_final/app.dart';
import 'package:provider/provider.dart';

import 'providers/root_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: RootProvider.providers(),
      child: const App(),
    ),
  );
}
