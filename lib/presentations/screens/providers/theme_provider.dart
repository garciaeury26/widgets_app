import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
//! StateProvider => (mutable)
//! Provider => (inmutable)

// Valor booleano mutable
final darkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);
