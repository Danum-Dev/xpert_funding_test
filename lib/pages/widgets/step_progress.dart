import 'package:flutter/material.dart';
import 'package:xpert_funding_test/commons/constants.dart';
import 'package:xpert_funding_test/commons/theme.dart';
import 'package:xpert_funding_test/pages/widgets/step_card.dart';

/// A horizontal step progress bar that displays multiple phases,
/// separated by dashed lines, highlighting the current active phase.
class StepProgressBar extends StatelessWidget {
  /// The current phase index (0-based).
  final int? currentPhase;

  /// The total number of evaluation phases.
  final int? numPhases;

  const StepProgressBar({
    super.key,
    required this.currentPhase,
    required this.numPhases,
  });

  @override
  Widget build(BuildContext context) {
    // Build the list of step data (icon + label)
    List<Map<String, String>> steps = [];

    // Add evaluation steps
    for (int i = 0; i <= (numPhases ?? 0); i++) {
      if (i != 0) {
        steps.add({
          "icon": barChartIcon,
          "label": "$evaluationLabel $i",
        });
      }
    }

    // Add final master step
    steps.add({
      "icon": lockIcon,
      "label": masterLabel,
    });

    return Container(
      // Padding above and below the step bar
      padding: const EdgeInsets.symmetric(vertical: 11.42),

      // Background and border styling
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        border: Border(
          top: BorderSide(color: Colors.white12, width: 1.14),
          bottom: BorderSide(color: Colors.white12, width: 1.14),
        ),
      ),

      // Arrange steps horizontally with equal spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildProgressRow(steps),
      ),
    );
  }

  /// Builds the entire row of steps with connecting dashed lines.
  List<Widget> _buildProgressRow(List<Map<String, String>> steps) {
    List<Widget> widgets = [
      // Leading dashed line (active at start)
      _buildDashedLine(active: true),
    ];

    for (int i = 0; i < steps.length + 1; i++) {
      // Determine if this step should be highlighted
      bool active = (currentPhase ?? 0) > i;

      if (i < steps.length) {
        // Add step card
        widgets.add(
          StepCard(
            icon: steps[i]["icon"]!,
            label: steps[i]["label"]!,
            active: active,
          ),
        );

        // Add dashed line between steps (not after last step)
        if (i != steps.length - 1) {
          widgets.add(_buildDashedLine(active: active));
        }
      } else {
        // Ending faded dashed line
        widgets.add(_buildDashedLineEnd(active: false));
      }
    }

    return widgets;
  }

  /// Creates a horizontal dashed line that fades from left to right.
  Widget _buildDashedLine({required bool active}) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate number of dashes based on available width
          final dashCount = (constraints.maxWidth / 6).floor();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (index) {
              // Opacity increases across the dash line
              double opacity = index / dashCount;
              return Container(
                width: 3,
                height: 1,
                color: active
                    ? stepProgressActiveColor.withValues(alpha: opacity)
                    : Colors.white.withValues(alpha: 0.2),
              );
            }),
          );
        },
      ),
    );
  }

  /// Creates a horizontal dashed line that fades from right to left.
  Widget _buildDashedLineEnd({required bool active}) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate number of dashes based on available width
          final dashCount = (constraints.maxWidth / 6).floor();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (index) {
              // Opacity decreases across the dash line
              double opacity = 1.0 - (index / dashCount);
              return Container(
                width: 3,
                height: 1,
                color: active
                    ? stepProgressActiveColor.withValues(alpha: opacity)
                    : Colors.white.withValues(alpha: 0.2 * opacity),
              );
            }),
          );
        },
      ),
    );
  }
}
