import 'package:flutter/material.dart';

class CartUpdateQuantityButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const CartUpdateQuantityButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade200,
        onPrimary: Colors.black,
      ),
      child: child,
    );
  }
}
