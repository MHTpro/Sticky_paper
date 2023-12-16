import 'package:stiky_paper/imports/imports_for_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<PaperColorProvider>(context, listen: false)
        .loadSavedColorPaper();

    Provider.of<TextProvider>(context, listen: false).loadSavedText();

    Provider.of<TextDirectionProvider>(context, listen: false)
        .loadSavedTextAlign();

    Provider.of<TextColorProvider>(context, listen: false).loadSavedTextColor();

    Provider.of<TextWeightProvider>(context, listen: false)
        .loadSavedTextWeight();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //provider
    final colorOfPaper = context.watch<PaperColorProvider>();
    final textWeightProvider = context.watch<TextWeightProvider>();
    final textColorProvider = context.watch<TextColorProvider>();
    final textDirectionProvider = context.watch<TextDirectionProvider>();
    final sizeOfWidget = context.watch<SizeOfWidget>();
    final textProvider = context.watch<TextProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.black,
        toolbarHeight: 30.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                windowManager.minimize();
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                windowManager.close();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              paper(
                context,
                colorOfPaper,
                textWeightProvider,
                textColorProvider,
                textDirectionProvider,
                sizeOfWidget,
                textProvider,
              ),
              paperColor(
                context,
                colorOfPaper,
              ),
              changeTextStyle(
                context,
                textWeightProvider,
                textColorProvider,
                textDirectionProvider,
              ),
              deleteText(
                context,
                textProvider.controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
