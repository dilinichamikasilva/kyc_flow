import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_checklist_event.dart';
part 'kyc_checklist_state.dart';

class KycChecklistBloc extends Bloc<KycChecklistEvent, KycChecklistState> {
  KycChecklistBloc() : super(const KycChecklistState()) {
    on<AboutYouCompleted>((event, emit) =>
        emit(state.copyWith(aboutYouCompleted: true)));
    on<YourIdentityCompleted>((event, emit) =>
        emit(state.copyWith(yourIdentityCompleted: true)));
    on<OtherDocumentCompleted>((event, emit) =>
        emit(state.copyWith(otherDocumentCompleted: true)));
  }
}
