import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payaki/utilities/style_utility.dart';

class TimerWidget extends StatefulWidget {
  final int durationInSeconds;
  final VoidCallback onTimerFinished;

  const TimerWidget({
    Key? key,
    required this.durationInSeconds,
    required this.onTimerFinished,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationInSeconds;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
        if (_remainingSeconds == 0) {
          _timer.cancel();
          widget.onTimerFinished();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String remainingTimeString =
        '${_remainingSeconds ~/ 60}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 35,
          child: Text(
            remainingTimeString,
            style: StyleUtility.resendOtpTextStyle.copyWith(
                decoration: TextDecoration.underline),
          ),
        ),
        Text(
          ' Sec Left',
          style: StyleUtility.detailTextStyle,
        ),
      ],
    );



  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}