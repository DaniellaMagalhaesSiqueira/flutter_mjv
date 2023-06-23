import 'package:app1/providers/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: RootProvider.providers(),
      child: const MyApp(),
    ),
  );
}
