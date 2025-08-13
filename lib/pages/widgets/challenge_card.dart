import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert_funding_test/commons/constants.dart';
import 'package:xpert_funding_test/commons/theme.dart';
import 'package:xpert_funding_test/commons/ui/dot.dart';
import 'package:xpert_funding_test/models/challenge_model.dart';
import 'package:xpert_funding_test/pages/widgets/pro_badge.dart';
import 'package:xpert_funding_test/pages/widgets/status_badge.dart';
import 'package:xpert_funding_test/pages/widgets/step_card.dart';
import 'package:xpert_funding_test/pages/widgets/step_progress.dart';

/// A widget that displays information about a challenge account.
/// 
/// It shows the account name, status, balance, purchase date, ID,
/// progress through challenge phases, and a button to access the dashboard.
class ChallengeCard extends StatelessWidget {
  /// The account data to be displayed.
  final ChallengeModel account;

  /// Whether the view is on a mobile device (affects layout and font sizes).
  final bool isMobile;

  const ChallengeCard({
    super.key,
    required this.account,
    required this.isMobile,
  });

  /// Returns the badge color based on the account's funding status.
  Color getStatusColor() =>
      account.isFunded ? fundedBadgeColor : challengeBadgeColor;

  /// Returns the badge background color based on the account's funding status.
  Color getStatusBgColor() =>
      account.isFunded ? fundedBgBadgeColor : challengeBgBadgeColor;

  /// Returns the font shadow color for the badge based on funding status.
  Color getStatusFontShadowColor() => account.isFunded
      ? fundedBadgeFontDropShadowColor
      : challengeBadgeFontDropShadowColor;

  /// Returns the text label for the status badge.
  String getStatusText() =>
      account.isFunded ? fundedLabel : onChallengeLabel;

  /// Returns the label for the current step of the challenge.
  String get currentLabelStep {
    if (account.currentPhase == null) return "-";
    if (account.currentPhase == 0) return "$evaluationLabel 1";
    if (account.currentPhase == 1) return "$evaluationLabel ${account.currentPhase}";
    if (account.currentPhase == 2) return "$evaluationLabel ${account.currentPhase}";
    return masterLabel;
  }

  /// Returns the icon path for the current step.
  String get currentIconStep {
    switch (account.currentPhase) {
      case 0:
        return barChartIcon;
      case 1:
        return barChartIcon;
      case 2:
        return barChartIcon;
      default:
        return lockIcon;
    }
  }

  /// Returns the enabled the current step badge.
  bool get enabledStepBadge {
    switch (account.currentPhase) {
      case 0:
        return false;
      case 1:
        return true;
      case 2:
        return true;
      case 3:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Responsive sizing based on device type
    double headerFontSize = isMobile ? 16 : 18;
    double balanceFontSize = isMobile ? 28 : 40;
    double buttonFontSize = isMobile ? 14 : 16;
    double paddingValue = isMobile ? 12 : 16;
    double iconSize = isMobile ? 12 : 14;

    return Container(
      // Card background with gradient and border
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: cardGradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor, width: 1),
      ),
      child: Column(
        children: [
          /// Card header with account status, name, balance, and details
          Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mobile layout: Status + StepCard in a column
                if (isMobile)
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StatusBadge(
                            statusText: getStatusText(),
                            badgeColor: getStatusColor(),
                            bgColor: getStatusBgColor(),
                            fontDropShadowColor: getStatusFontShadowColor(),
                          ),
                          const SizedBox(width: 10),
                          StepCard(
                            icon: currentIconStep,
                            label: currentLabelStep,
                            active: enabledStepBadge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                /// Account name + Pro badge (if applicable) + status badge (desktop only)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          account.accountName ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: headerFontSize,
                          ),
                        ),
                        if (account.isProAccount ?? false) ...[
                          SizedBox(width: isMobile ? 4 : 8),
                          const ProBadge(),
                        ],
                      ],
                    ),
                    if (!isMobile)
                      StatusBadge(
                        statusText: getStatusText(),
                        badgeColor: getStatusColor(),
                        bgColor: getStatusBgColor(),
                        fontDropShadowColor: getStatusFontShadowColor(),
                      ),
                  ],
                ),

                SizedBox(height: isMobile ? 8 : 12),

                /// Account size
                Text(
                  "\$${currencyFormat.format(account.equity ?? 0)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: balanceFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: isMobile ? 8 : 12),

                /// Account details: Balance, Bought date, ID
                Wrap(
                  spacing: 2.0,
                  runSpacing: 2.0,
                  alignment: WrapAlignment.start,
                  children: [
                    // Balance
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: balanceLabel,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.13,
                            ),
                            children: [
                              TextSpan(
                                text: "\$${currencyFormat.format(account.balance ?? 0)} ",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        if (!isMobile) ...[
                          const Dot(),
                          const SizedBox(width: 9.0),
                        ],
                      ],
                    ),

                    // Purchase date
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: isMobile ? "$boughtLabel :  " : "$boughtLabel ",
                            style: TextStyle(
                              color: isMobile ? Colors.white70 : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.13,
                            ),
                            children: [
                              TextSpan(
                                text: account.createdAt != null
                                    ? formatDate(account.createdAt!)
                                    : '-',
                                style: TextStyle(
                                  decoration: isMobile ? null : TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Icon(Icons.info_outline, size: 13.32, color: Colors.white24),
                        const SizedBox(width: 9.0),
                        if (!isMobile) ...[
                          const Dot(),
                          const SizedBox(width: 9.0),
                        ],
                      ],
                    ),

                    // Account ID
                    Row(
                      children: [
                        Text(
                          "$idLabel ${account.id ?? '-'}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.13,
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Icon(Icons.info_outline, size: 13.32, color: Colors.white24),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Progress bar for desktop
          if (!isMobile)
            StepProgressBar(
              currentPhase: account.currentPhase ?? 0,
              numPhases: account.numPhases ?? 0,
            ),

          /// Dashboard button
          Padding(
            padding: EdgeInsets.all(paddingValue),
            child: InkWell(
              onTap: () {
                // TODO: Implement navigation to dashboard
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 10 : 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      dashboardIcon,
                      width: iconSize,
                      height: iconSize,
                    ),
                    SizedBox(width: isMobile ? 4 : 6),
                    Text(
                      dashboardButtonLabel,
                      style: TextStyle(
                        color: dashboardButtonLabelColor,
                        fontWeight: FontWeight.w500,
                        fontSize: buttonFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
