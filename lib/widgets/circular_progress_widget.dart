import 'package:flutter/material.dart';
import 'package:payaki/utilities/color_utility.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      color: ColorUtility.color9C5FA3,
    ),);
  }
}
