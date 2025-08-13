/// A model class that represents a trading challenge.
///
/// This model is used to store account details, progress phase,
/// balance, and other properties of a challenge account.
class ChallengeModel {
  /// Unique identifier for the challenge.
  final String? id;

  /// Date and time when the challenge was created.
  final DateTime? createdAt;

  /// Current balance of the account.
  final double? balance;

  /// Current equity of the account.
  final double? equity;

  /// Name of the challenge account.
  final String? accountName;

  /// Current phase number of the challenge.
  /// - `0` = Funded
  /// - `1` = Evaluation phase 1
  /// - `2` = Evaluation phase 2
  /// - ...
  final int? currentPhase;

  /// Total number of evaluation phases in the challenge.
  final int? numPhases;

  /// Account size (capital amount in USD or other currency).
  final double? size;

  /// Whether the account is currently active.
  final bool? active;

  /// Whether the account is a "Pro" account type.
  final bool? isProAccount;

  /// Constructor for creating a [ChallengeModel] instance.
  ChallengeModel({
    this.id,
    this.createdAt,
    this.balance,
    this.equity,
    this.accountName,
    this.currentPhase,
    this.numPhases,
    this.size,
    this.active,
    this.isProAccount,
  });

  /// Factory constructor to create a [ChallengeModel] instance from JSON.
  ///
  /// - [json] : A map containing key-value pairs from an API or local storage.
  /// - Returns : A [ChallengeModel] object populated with data from the JSON map.
  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      balance: (json['balance'] as num?)?.toDouble(),
      equity: (json['equity'] as num?)?.toDouble(),
      accountName: json['accountName'] as String?,
      currentPhase: json['currentPhase'] as int?,
      numPhases: json['numPhases'] as int?,
      size: (json['size'] as num?)?.toDouble(),
      active: json['active'] as bool?,
      isProAccount: json['isProAccount'] as bool?,
    );
  }

  /// Converts the [ChallengeModel] instance into a JSON map.
  ///
  /// - Returns : A `Map<String, dynamic>` containing all the object’s properties.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'balance': balance,
      'equity': equity,
      'accountName': accountName,
      'currentPhase': currentPhase,
      'numPhases': numPhases,
      'size': size,
      'active': active,
      'isProAccount': isProAccount,
    };
  }

  /// Whether the challenge is currently in progress (not funded).
  ///
  /// - Returns : `true` if `currentPhase` is greater than 0, else `false`.
  bool get isOnChallenge {
    return currentPhase != null && currentPhase! > 0;
  }

  /// Whether the account is in the funded phase (phase 0).
  bool get isFunded => currentPhase == 0;
}
