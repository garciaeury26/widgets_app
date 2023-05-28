import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//! StateProvider => (mutable)
//! Provider => (inmutable)

// Valor booleano mutable
final darkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un objeto de tipo AppTheme (custom)
// StateNotifierProvider<Clase,estado>()
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Notifier or controller
class ThemeNotifier extends StateNotifier<AppTheme> {
  // State = Estado = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void togleDarkMode() {
    // ? riverpod se dara cuenta de que estamos cambiando el estado
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeSeledtedColor(int selectedValue) {
    state = state.copyWith(selectedColor: selectedValue);
  }
}
