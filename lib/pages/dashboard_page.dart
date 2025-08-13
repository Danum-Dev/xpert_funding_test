import 'package:flutter/material.dart';
import 'package:xpert_funding_test/commons/constants.dart';
import 'package:xpert_funding_test/commons/theme.dart';
import 'package:xpert_funding_test/models/challenge_model.dart';
import 'package:xpert_funding_test/pages/widgets/challenge_card.dart';

/// DashboardPage - Displays the dashboard containing a list of challenges/accounts
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  /// List of challenges to be displayed on the dashboard
  List<ChallengeModel>? challenges = challengesDummyData;

  @override
  Widget build(BuildContext context) {
    /// Determine if the device is considered mobile based on screen width
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      body: Container(
        /// Apply a vertical gradient background for the dashboard
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: pageBgGradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          /// Responsive padding - smaller for mobile, larger for desktop/tablet
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: isMobile ? 16 : 80,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              /// Set the maximum card width
              /// - Mobile: full width
              /// - Larger screens: half of available space minus gap
              double maxWidth = isMobile
                  ? constraints.maxWidth
                  : constraints.maxWidth / 2 - 20;

              return SingleChildScrollView(
                child: Wrap(
                  /// Horizontal space between items
                  spacing: 20,
                  /// Vertical space between items when wrapping
                  runSpacing: 20,
                  children: (challenges ?? []).map((account) {
                    return SizedBox(
                      width: maxWidth,
                      child: ChallengeCard(
                        account: account,
                        isMobile: isMobile,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
