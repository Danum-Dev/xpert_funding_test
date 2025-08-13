import 'package:flutter/material.dart';

/// A reusable badge widget to display a status label
/// with customizable colors, border, and shadow effects.
class StatusBadge extends StatelessWidget {
  /// The text label to be displayed inside the badge.
  final String statusText;

  /// The color for the drop shadow behind the text.
  final Color fontDropShadowColor;

  /// The color of the text and the badge border.
  final Color badgeColor;

  /// The background color of the badge.
  final Color bgColor;

  const StatusBadge({
    super.key,
    required this.statusText,
    required this.fontDropShadowColor,
    required this.badgeColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Internal padding for spacing inside the badge
      padding: const EdgeInsets.symmetric(horizontal: 12.67, vertical: 2.5),

      // Badge styling
      decoration: BoxDecoration(
        color: bgColor, // Solid background color
        borderRadius: BorderRadius.circular(50), // Fully rounded badge
        border: Border.all(
          color: badgeColor, // Border color matching the text
          width: 1.0,
        ),
      ),

      // The status text
      child: Text(
        statusText,
        style: TextStyle(
          color: badgeColor, // Text color
          fontSize: 16.43,
          fontWeight: FontWeight.w700, // Bold text for emphasis
          shadows: [
            Shadow(
              color: fontDropShadowColor, // Shadow color behind text
              blurRadius: 20, // Soft blur for glow effect
              offset: const Offset(0, 2), // Slight downward offset
            ),
          ],
        ),
      ),
    );
  }
}
