import 'imports/imports_for_main.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  //windows settings
  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    windowButtonVisibility: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //providers
      providers: [
        ChangeNotifierProvider<PaperColorProvider>(
          create: (context) => PaperColorProvider(),
        ),
        ChangeNotifierProvider<TextWeightProvider>(
          create: (context) => TextWeightProvider(),
        ),
        ChangeNotifierProvider<TextColorProvider>(
          create: (context) => TextColorProvider(),
        ),
        ChangeNotifierProvider<TextDirectionProvider>(
          create: (context) => TextDirectionProvider(),
        ),
        ChangeNotifierProvider<SizeOfWidget>(
          create: (context) => SizeOfWidget(),
        ),
        ChangeNotifierProvider<TextProvider>(
          create: (context) => TextProvider(),
        ),
      ],

      //
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
