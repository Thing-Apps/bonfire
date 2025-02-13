import 'dart:ui';

import 'package:bonfire/geometry/shape.dart';
import 'package:bonfire/util/extensions/extensions.dart';
import 'package:flame/components.dart';

class RectangleShape extends Shape {
  Rect _rect;
  late Vector2 leftTop;
  late Vector2 rightTop;
  late Vector2 rightBottom;
  late Vector2 leftBottom;

  RectangleShape(Vector2 size, {Vector2? position})
      : _rect = Rect.fromLTWH(
          position?.x ?? 0,
          position?.y ?? 0,
          size.x,
          size.y,
        ),
        super(position ?? Vector2.zero()) {
    _updateExtremities(this.position);
  }

  @override
  set position(Vector2 value) {
    if (value != super.position) {
      super.position = value;
      _updateExtremities(value);
    }
  }

  void _updateExtremities(Vector2 value) {
    _rect = Rect.fromLTWH(
      value.x,
      value.y,
      _rect.width,
      _rect.height,
    );
    this.leftTop = _rect.topLeft.toVector2();
    this.rightTop = _rect.topRight.toVector2();
    this.rightBottom = _rect.bottomRight.toVector2();
    this.leftBottom = _rect.bottomLeft.toVector2();
  }

  Rect get rect => _rect;

  double get height => _rect.height;
  double get width => _rect.width;
  double get left => _rect.left;
  double get top => _rect.top;
  double get right => _rect.right;
  double get bottom => _rect.bottom;

  @override
  void render(Canvas canvas, Paint paint) {
    canvas.drawRect(rect, paint);
  }
}
