import 'package:stiky_paper/imports/imports_for_paper.dart';

paper(
  BuildContext context,
  PaperColorProvider colorOfPaper,
  TextWeightProvider textWeightProvider,
  TextColorProvider textColorProvider,
  TextDirectionProvider textDirectionProvider,
  SizeOfWidget sizeOfWidget,
  TextProvider textProvider,
) {
  return
      //paper --start
      Padding(
    padding: const EdgeInsets.only(
      top: 15.0,
      bottom: 15.0,
      left: 40,
      right: 40.0,
    ),
    child: Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40.0,
        ),
        height: sizeOfWidget.containerheight,
        width: sizeOfWidget.containerWidth,

        alignment: (textDirectionProvider.isLtr)
            ? Alignment.topLeft
            : Alignment.topRight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/${colorOfPaper.currentColorPaper}_paper.png",
            ),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),

        //text --start
        child: IntrinsicWidth(
          child: Directionality(
            textDirection: textDirectionProvider.isLtr
                ? TextDirection.ltr
                : TextDirection.rtl,
            //keyboard
            child: RawKeyboardListener(
              focusNode: FocusNode(),

              //check fot tab key
              onKey: (RawKeyEvent event) async {
                if (event is RawKeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.tab) {
                  await WindowManager.instance.setFullScreen(false);

                  sizeOfWidget.changeSize();
                }
              },
              child: TextField(
                onTap: () async {
                  // Enter fullscreen
                  await WindowManager.instance.setFullScreen(true);
                  sizeOfWidget.changeSize();
                },
                onChanged: (_) async {
                  await textProvider.saveText();
                },
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "type...",
                  hintStyle: TextStyle(
                    fontFamily: "font",
                    fontWeight: textWeightProvider.weightStyles == 1
                        ? FontWeight.w100
                        : textWeightProvider.weightStyles == 2
                            ? FontWeight.normal
                            : textWeightProvider.weightStyles == 3
                                ? FontWeight.bold
                                : textWeightProvider.weightStyles == 4
                                    ? FontWeight.w900
                                    : null,
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 30),
                    color:
                        textColorProvider.isBlack ? Colors.black : Colors.white,
                  ),
                ),
                textDirection: textDirectionProvider.isLtr
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                textAlign: TextAlign.justify,
                controller: textProvider.controller,
                minLines: 1,
                maxLines: 20,
                style: TextStyle(
                  fontSize:
                      const AdaptiveTextSize().getadaptiveTextSize(context, 30),
                  fontWeight: textWeightProvider.weightStyles == 1
                      ? FontWeight.w100
                      : textWeightProvider.weightStyles == 2
                          ? FontWeight.normal
                          : textWeightProvider.weightStyles == 3
                              ? FontWeight.bold
                              : textWeightProvider.weightStyles == 4
                                  ? FontWeight.w900
                                  : null,
                  color:
                      textColorProvider.isBlack ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
        //text --end
      ),
    ),
  );
  //paper --end
}
