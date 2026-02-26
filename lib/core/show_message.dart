import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  (showDialog(context: context, builder:

      (context) {
    return AlertDialog(content:
    Row(children: [Text("Loading..."),
      Spacer(), CircularProgressIndicator()

    ],)
    );
  })
  );
}

showMessage(BuildContext context,
    String text,
    {String? title,
      String? posText,
      String? negText,
      Function? onPosClick,
      Function? onNegClick,

    }) {
  (showDialog(context: context, builder:

      (context) {
    return AlertDialog(
      title: title!=null? Text(title):null,
      content: Text(text),

      actions: [
        if(posText!=null)
          TextButton(
            onPressed: (){
              onPosClick?.call();
              Navigator.pop(context);
            },
            child:Text(posText),
          ),
        if(negText!=null)
          TextButton(
            onPressed: (){
              onNegClick?.call();
              Navigator.pop(context);
            },
            child:Text(negText),
          )


      ],);
  })
  );
}