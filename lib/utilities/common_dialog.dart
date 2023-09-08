import 'package:flutter/material.dart';
import 'package:payaki/utilities/color_utility.dart';

class CommonDialog{


  //Show loading dialog
  static showLoadingDialog(BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(ColorUtility.color9C5FA3),
                        strokeWidth: 2.0,
                      ),
                      /*Platform.isAndroid
                      ? */
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Please wait...",
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      )
//                      : SizedBox(),
                    ]),
              ),
            ));
      },
    );
  }

}