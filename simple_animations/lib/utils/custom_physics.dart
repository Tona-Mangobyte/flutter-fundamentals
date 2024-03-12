import 'package:flutter/cupertino.dart';

class CustomScrollPhysics extends ScrollPhysics {
  final double velocityFactor;

  CustomScrollPhysics({this.velocityFactor = 1.0, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
        velocityFactor: velocityFactor, parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Apply the velocity factor to the user's scroll offset
    return super.applyPhysicsToUserOffset(position, offset * velocityFactor);
  }
}