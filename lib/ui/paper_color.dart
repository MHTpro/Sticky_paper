import 'package:stiky_paper/imports/imports_for_paper_color.dart';

Widget paperColor(
  BuildContext context,
  PaperColorProvider colorOfPaper,
) {
  //choose color of paper --start
  return Positioned(
    top: 10.0,
    right: 10.0,
    child: LimitedBox(
      maxHeight: 50.0,
      maxWidth: 50.0,
      child: GestureDetector(
        onTap: () async {
          final navigator = Navigator.of(context);
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Choose a color",
                ),
                content: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: <Widget>[
                    papers(
                      color: "yellow",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(10);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "white",
                      ontap: () async {
                        colorOfPaper.changeColorofPaper(9);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "red",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(8);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "pink",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(7);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "orange",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(6);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "green",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(5);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "gray",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(4);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "cyan",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(3);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "blue",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(2);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "black",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(1);
                        await colorOfPaper.saveColorPaper();

                        navigator.pop();
                      },
                    ),
                    papers(
                      color: "purple",
                      ontap: () async {
                        await colorOfPaper.changeColorofPaper(0);
                        await colorOfPaper.saveColorPaper();
                        navigator.pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
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
            Icons.image,
            size: 20.sp,
          ),
        ),
      ),
    ),
  );
}

//show all colors of paper
GestureDetector papers({
  required String color,
  required Function()? ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 80.0,
      width: 120.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
        ),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/${color}_paper.png",
          ),
        ),
      ),
    ),
  );
}
 //choose color of paper --end
