

import 'package:projeto_final/providers/recipe_provider.dart';
import 'package:projeto_final/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ];
  }
}