import '../__lib.dart';

final appThemeModeProvider =
    StateNotifierProvider<AppThemeModeProvider, AppThemeMode>(
  (ref) => AppThemeModeProvider(AppThemeMode.ligth),
);
final appThemeProvider = StateNotifierProvider<AppThemeDataProvider, BaseTheme>(
  (ref) => AppThemeDataProvider(ref, AppBaseThemeValues.lightTheme),
);

class AppThemeDataProvider extends StateNotifier<BaseTheme> {
  final StateNotifierProviderRef ref;
  AppThemeDataProvider(this.ref, super.state);

  BaseTheme get theme => ref.read(appThemeModeProvider) == AppThemeMode.ligth
      ? AppBaseThemeValues.lightTheme
      : AppBaseThemeValues.lightTheme; // AppBaseThemeValues.darkTheme;

  Color get primaryColor => theme.primaryColor;
}

class AppThemeModeProvider extends StateNotifier<AppThemeMode>
    with WidgetsBindingObserver {
  AppThemeModeProvider(super.state) {
    if (WidgetsBinding.instance.window.platformBrightness == Brightness.light) {
      state = AppThemeMode.ligth;
    } else {
      state = AppThemeMode.dark;
    }
  }
  update(AppThemeMode newMode) {
    state = newMode;
  }

  @override
  void didChangePlatformBrightness() {
    if (WidgetsBinding.instance.window.platformBrightness == Brightness.light) {
      state = AppThemeMode.ligth;
    } else {
      state = AppThemeMode.dark;
    }

    super.didChangePlatformBrightness();
  }
}
