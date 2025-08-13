import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpert_funding_test/commons/theme.dart';

/// A card widget representing a step in a process,  
/// with an icon, label, and an optional active state highlighting.
class StepCard extends StatelessWidget {
  /// Path to the SVG icon asset displayed in the card.
  final String icon;

  /// The text label shown next to the icon.
  final String label;

  /// Determines whether the card should be highlighted (active state).
  final bool active;

  const StepCard({
    super.key,
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding inside the card
      padding: const EdgeInsets.symmetric(horizontal: 13.7, vertical: 4.57),

      // Background and border styling
      decoration: BoxDecoration(
        // If active, apply gradient; otherwise, semi-transparent white background
        gradient: active
            ? LinearGradient(
                colors: [
                  stepProgressActiveBgColor,
                  stepProgressActiveBgColor.withValues(alpha: 0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: active ? null : Colors.white.withValues(alpha: 0.05),

        // Rounded corners with large radius to make a pill shape
        borderRadius: BorderRadius.circular(1140.57),

        // Thin border with subtle transparency
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),

      // Horizontal layout: icon + spacing + text
      child: Row(
        children: [
          // Display the SVG icon
          SvgPicture.asset(
            icon,
            width: 10.67,
            height: 10.67,
          ),

          // Spacing between icon and text
          const SizedBox(width: 6.85),

          // Step label text
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13.7,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
