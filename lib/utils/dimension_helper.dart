import 'package:flutter/material.dart';

double mediaQueryVertical (BuildContext context, double height)  => MediaQuery.of(context).size.height * height;



double mediaQueryHorizontal (BuildContext context, double height)  =>
    MediaQuery.of(context).size.width * height;