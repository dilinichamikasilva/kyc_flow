part of 'kyc_checklist_bloc.dart';

abstract class KycChecklistEvent extends Equatable {
  const KycChecklistEvent();

  @override
  List<Object?> get props => [];
}

class AboutYouCompleted extends KycChecklistEvent {
  const AboutYouCompleted();
}

class YourIdentityCompleted extends KycChecklistEvent {
  const YourIdentityCompleted();
}

class OtherDocumentCompleted extends KycChecklistEvent {
  const OtherDocumentCompleted();
}
