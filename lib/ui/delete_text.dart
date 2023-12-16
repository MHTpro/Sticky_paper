import 'package:stiky_paper/imports/imports_for_delete.dart';

Widget deleteText(BuildContext context, TextEditingController controller) {
  return //delete text --start
      Positioned(
    top: 130.0,
    right: 10.0,
    child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Are you sure to delete text?",
              ),
              actions: <Widget>[
                actionsButtons(
                  context,
                  () {
                    Navigator.pop(context, false);
                  },
                  "Cancle",
                  Colors.blue,
                ),
                actionsButtons(
                  context,
                  () {
                    controller.clear();
                    Navigator.pop(context, true);
                  },
                  "Delete",
                  Colors.red,
                ),
              ],
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
            Icons.delete,
            size: 20.sp,
          ),
        ),
      ),
    ),
  );
  //delete text --end
}

//action buttons for delete text
TextButton actionsButtons(
  BuildContext context,
  Function()? onTap,
  String text,
  Color textColor,
) {
  return TextButton(
    onPressed: onTap,
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}
