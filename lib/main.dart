import '__lib.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScaleAware(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final appTheme = ref.watch(appThemeProvider);
            return MaterialApp(
              title: 'Monie Point',
              theme: ThemeData(
                primarySwatch: Colors.green,
                scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
                fontFamily: 'roboto',
                brightness: appTheme.brightness,
                inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: appTheme.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              home: const DahboardScreen(),
              builder: (context, child) {
                final mediaQueryData = MediaQuery.of(context);
                final scale = mediaQueryData.textScaleFactor.clamp(0.7, .9);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                  child: child ?? const SizedBox.shrink(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
