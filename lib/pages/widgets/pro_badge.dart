import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xpert_funding_test/commons/constants.dart';
import 'package:xpert_funding_test/commons/theme.dart';

/// A badge widget that displays the "PRO" label with a gradient border
/// and a blurred shadow effect for a premium look.
class ProBadge extends StatelessWidget {
  const ProBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Outer padding for the gradient border
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        // Outer gradient border
        gradient: const LinearGradient(
          colors: badgeGradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        // Inner padding for the badge content
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        decoration: BoxDecoration(
          color: proBadgeColor, // Solid background color for the badge
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// First text layer with blur effect to create a soft glow behind text
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: Text(
                proLabel,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5), // Semi-transparent white
                  fontSize: 13.7,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: proBadgeFontDropShadowColor,
                      blurRadius: 11.42,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),

            /// Main text layer (in front) to display "PRO" clearly
            Text(
              proLabel,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5), // Semi-transparent white
                fontSize: 13.7,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: proBadgeFontDropShadowColor,
                    blurRadius: 11.42,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
