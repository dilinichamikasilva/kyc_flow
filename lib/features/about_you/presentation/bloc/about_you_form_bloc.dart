import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc_platform/core/utils/helper.dart';

part 'about_you_form_event.dart';
part 'about_you_form_state.dart';

class AboutYouFormBloc extends Bloc<AboutYouFormEvent, AboutYouFormState> {
  AboutYouFormBloc() : super(const AboutYouFormState()) {
    on<NationalIdChanged>((event, emit) =>
        emit(_revalidate(state.copyWith(nationalId: event.value))));
    on<FirstNameChanged>((event, emit) =>
        emit(_revalidate(state.copyWith(firstName: event.value))));
    on<LastNameChanged>((event, emit) =>
        emit(_revalidate(state.copyWith(lastName: event.value))));
    on<OtherNamesChanged>((event, emit) =>
        emit(_revalidate(state.copyWith(otherNames: event.value))));
    on<DateOfBirthChanged>((event, emit) =>
        emit(_revalidate(state.copyWith(dateOfBirth: event.value))));
    on<FormSubmitted>((event, emit) {
      final revalidated = _revalidate(state);
      emit(revalidated.copyWith(submittedSuccessfully: revalidated.isValid));
    });
  }

  AboutYouFormState _revalidate(AboutYouFormState current) {
    final nationalIdError = Helper.nationalId(current.nationalId);
    final firstNameError =
        Helper.name(current.firstName, fieldName: 'First name');
    final lastNameError =
        Helper.name(current.lastName, fieldName: 'Last name');
    final otherNamesError = Helper.optionalName(
      current.otherNames,
      fieldName: 'Other names',
    );
    final dobError = Helper.dateOfBirth18Plus(current.dateOfBirth);

    final isValid = nationalIdError == null &&
        firstNameError == null &&
        lastNameError == null &&
        otherNamesError == null &&
        dobError == null;

    return current.copyWith(
      nationalIdError: current.nationalId.isNotEmpty ? nationalIdError : null,
      firstNameError: current.firstName.isNotEmpty ? firstNameError : null,
      lastNameError: current.lastName.isNotEmpty ? lastNameError : null,
      otherNamesError: otherNamesError,
      dobError: current.dateOfBirth.isNotEmpty ? dobError : null,
      isValid: isValid,
    );
  }
}
