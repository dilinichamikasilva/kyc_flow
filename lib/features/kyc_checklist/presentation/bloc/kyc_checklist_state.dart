part of 'kyc_checklist_bloc.dart';

class KycChecklistState extends Equatable {
  final bool aboutYouCompleted;
  final bool yourIdentityCompleted;
  final bool otherDocumentCompleted;

  const KycChecklistState({
    this.aboutYouCompleted = false,
    this.yourIdentityCompleted = false,
    this.otherDocumentCompleted = false,
  });

  KycChecklistState copyWith({
    bool? aboutYouCompleted,
    bool? yourIdentityCompleted,
    bool? otherDocumentCompleted,
  }) {
    return KycChecklistState(
      aboutYouCompleted: aboutYouCompleted ?? this.aboutYouCompleted,
      yourIdentityCompleted:
          yourIdentityCompleted ?? this.yourIdentityCompleted,
      otherDocumentCompleted:
          otherDocumentCompleted ?? this.otherDocumentCompleted,
    );
  }

  @override
  List<Object?> get props => [
        aboutYouCompleted,
        yourIdentityCompleted,
        otherDocumentCompleted,
      ];
}
