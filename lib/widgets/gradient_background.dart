import 'package:flutter/material.dart';


Widget gradientBackground(startColor, endColor) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.2]
      )
    )

  );
}