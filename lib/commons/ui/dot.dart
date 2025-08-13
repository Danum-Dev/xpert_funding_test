import 'package:flutter/material.dart';

/// A small circular dot widget.
/// 
/// This can be used as a pagination indicator, carousel dot,
/// or a decorative element in the UI.
class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set the dot's width (same as height for a perfect circle)
      width: 4.57,
      height: 4.57,

      // Decoration for the circle
      decoration: BoxDecoration(
        color: Colors.white, // Fill color of the dot
        borderRadius: BorderRadius.circular(100), // Makes the shape fully rounded
      ),
    );
  }
}
