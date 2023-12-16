// ignore_for_file: use_build_context_synchronously

import 'package:stiky_paper/imports/imports_for_text_style.dart';

Widget changeTextStyle(
  BuildContext context,
  TextWeightProvider textWeightProvider,
  TextColorProvider textColorProvider,
  TextDirectionProvider textDirectionProvider,
) {
  //change text style --start
  return Positioned(
    top: 70.0,
    right: 10.0,
    child: GestureDetector(
      //onTap
      onTap: () {
        //dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "change style of text",
              ),
              content: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    titles("Change Weight of text"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    wrapWidget(
                      [
                        weightStyles(
                          "Thin",
                          FontWeight.w100,
                          () async {
                            textWeightProvider.thinWeight();
                            await textWeightProvider.saveTextWeght();
                            Navigator.pop(context);
                          },
                        ),
                        weightStyles(
                          "Regular",
                          null,
                          () async {
                            textWeightProvider.regularWeight();
                            await textWeightProvider.saveTextWeght();
                            Navigator.pop(context);
                          },
                        ),
                        weightStyles(
                          "Bold",
                          FontWeight.bold,
                          () async {
                            textWeightProvider.boldWeight();
                            await textWeightProvider.saveTextWeght();
                            Navigator.pop(context);
                          },
                        ),
                        weightStyles(
                          "Heavy",
                          FontWeight.w900,
                          () async {
                            textWeightProvider.heavyWeight();
                            await textWeightProvider.saveTextWeght();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    titles("Change color of text"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    wrapWidget(
                      [
                        textColors(
                          Colors.transparent,
                          Colors.transparent,
                          () {},
                        ),
                        textColors(
                          Colors.white,
                          Colors.black,
                          () async {
                            textColorProvider.blackColor();
                            await textColorProvider.saveTextColor();
                            Navigator.pop(context);
                          },
                        ),
                        textColors(
                          Colors.black,
                          Colors.white,
                          () async {
                            textColorProvider.whiteColor();
                            await textColorProvider.saveTextColor();
                            Navigator.pop(context);
                          },
                        ),
                        textColors(
                          Colors.transparent,
                          Colors.transparent,
                          () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    titles("Change Align of text"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    wrapWidget(
                      [
                        alignOfText(
                          "English",
                          () async {
                            textDirectionProvider.textDirectionLtr();
                            await textDirectionProvider.saveTextAlign();
                            Navigator.pop(context);
                          },
                        ),
                        alignOfText(
                          "Persian",
                          () async {
                            textDirectionProvider.textDirectionRtl();
                            await textDirectionProvider.saveTextAlign();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: LimitedBox(
        maxHeight: 50.0,
        maxWidth: 50.0,
        child: Container(
          alignment: Alignment.center,
          height: Adaptive.h(8),
          width: Adaptive.w(8),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.text_fields_rounded,
            size: 20.sp,
          ),
        ),
      ),
    ),
  );

  //change text style --end
}

Widget wrapWidget(List<Widget> widgets) {
  return Wrap(
    spacing: 10.0,
    runSpacing: 10.0,
    children: widgets,
  );
}

//change align of text
Widget alignOfText(
  String language,
  Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50.0,
      width: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Colors.amber.withOpacity(0.4),
      ),
      child: Text(
        language,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

//change text colors
Widget textColors(
  Color containerColor,
  Color borderColor,
  Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: containerColor,
          width: 1,
        ),
        color: borderColor,
        shape: BoxShape.circle,
      ),
    ),
  );
}

//weight styles
Widget weightStyles(
  String text,
  FontWeight? fontWeight,
  Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50.0,
      width: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Colors.amber.withOpacity(0.4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

//titles
Text titles(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
