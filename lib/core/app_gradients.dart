import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF367657),
    Color(0xFF25B985),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}

class AppGradientsLite {
  static final linear = LinearGradient(colors: [
    Color(0xFF4ce0aa),
    Color(0xFF25B985),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
