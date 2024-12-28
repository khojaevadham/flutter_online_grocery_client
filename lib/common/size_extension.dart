import 'package:flutter/material.dart';

class  WSize {
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static Size size(BuildContext context) => MediaQuery.of(context).size;  
}