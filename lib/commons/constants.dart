import 'package:intl/intl.dart';
import 'package:xpert_funding_test/models/challenge_model.dart';

/// =======================
/// App Constants & Labels
/// =======================

/// Main application title.
const String appTitle = "Xpert Funding Test";

/// Label for "Pro" accounts.
const String proLabel = "PRO";

/// Label for displaying account balance.
const String balanceLabel = "Balance :  ";

/// Label for purchased or acquired items.
const String boughtLabel = "Bought";

/// Label for displaying account ID.
const String idLabel = "ID:";

/// Label for the Dashboard navigation button.
const String dashboardButtonLabel = "Dashboard";

/// Label for evaluation stages.
const String evaluationLabel = "Evaluation";

/// Label for a master account type.
const String masterLabel = "Master Account";

/// Label for funded accounts.
const String fundedLabel = "Funded";

/// Label for accounts currently in a challenge.
const String onChallengeLabel = "On Challenge";

/// =======================
/// Helper Functions
/// =======================

/// Formats a [DateTime] object into a readable string format:
/// Example: `Mar 20, 2025`
/// 
/// - [date] : The date to be formatted.
/// - Returns : A formatted date string in `MMM dd, yyyy` style.
String formatDate(DateTime date) {
  final months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  
  return "${months[date.month - 1]} ${date.day}, ${date.year}";
}

/// =======================
/// Dummy Data for Testing
/// =======================

/// A sample list of [ChallengeModel] objects
/// representing different challenge states.
/// 
/// Useful for UI testing before backend integration.
List<ChallengeModel> challengesDummyData = [
  ChallengeModel(
    id: "123453Fdfd",
    createdAt: DateTime(2025, 3, 20),
    balance: 6340,
    equity: 5000,
    accountName: "Two Step Challenge",
    currentPhase: 1,
    numPhases: 2,
    size: 0,
    active: true,
    isProAccount: true,
  ),
  ChallengeModel(
    id: "123453Fdfd",
    createdAt: DateTime(2025, 3, 20),
    balance: 6340,
    equity: 25000,
    accountName: "Two Step Challenge",
    currentPhase: 3, // Note: currentPhase > numPhases here, possibly intentional for testing
    numPhases: 2,
    size: 0,
    active: true,
    isProAccount: true,
  ),
  ChallengeModel(
    id: "123453Fdfd",
    createdAt: DateTime(2025, 3, 20),
    balance: 6340,
    equity: 10000,
    accountName: "Two Step Challenge",
    currentPhase: 0, // Funded phase
    numPhases: 2,
    size: 0,
    active: true,
    isProAccount: true,
  ),
];

/// =======================
/// Number Formatting
/// =======================

/// Currency formatter for displaying numbers with commas.
/// Example: `6,340`
/// 
/// Uses US locale formatting.
final currencyFormat = NumberFormat("#,##0", "en_US");
