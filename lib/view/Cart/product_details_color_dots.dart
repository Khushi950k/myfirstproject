import 'package:flutter/material.dart';

class ProductDetailColorDot extends StatelessWidget {
  const ProductDetailColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.only(
          top: 20 * 0.5,
          left: 20 * 0.5,
          right: 20 * 0.5),
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}