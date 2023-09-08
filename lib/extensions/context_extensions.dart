import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ContextExtensions on BuildContext {
  /*void showSnackBar({
    required String message,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        key: ValueKey(message),
        behavior: behavior ?? SnackBarBehavior.fixed,
        margin: behavior == SnackBarBehavior.fixed
            ? const EdgeInsets.only(left: 16, right: 16, bottom: 16)
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        content: Text(message),
        action: action,
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        key: ValueKey(message),
        backgroundColor: Theme.of(this).colorScheme.errorContainer,
        behavior: behavior ?? SnackBarBehavior.fixed,
        margin: behavior == SnackBarBehavior.fixed
            ? const EdgeInsets.only(left: 16, right: 16, bottom: 16)
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        content: Text(
          message,
          style: Theme.of(this)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(this).colorScheme.onErrorContainer),
        ),
        action: action,
      ),
    );
  }*/

  void flushBarTopErrorMessage({
    required String message,
  }) {
    showFlushbar(
      context: this,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(this),
    );
  }

  void flushBarTopSuccessMessage({
    required String message,
  }) {
    showFlushbar(
      context: this,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.verified,
          size: 28,
          color: Colors.white,
        ),
      )..show(this),
    );
  }

  void showToast({
    required String message,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
