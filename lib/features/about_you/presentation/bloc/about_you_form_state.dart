part of 'about_you_form_bloc.dart';

class AboutYouFormState extends Equatable {
  final String nationalId;
  final String firstName;
  final String lastName;
  final String otherNames;
  final String dateOfBirth;

  final String? nationalIdError;
  final String? firstNameError;
  final String? lastNameError;
  final String? otherNamesError;
  final String? dobError;
  final bool isValid;
  final bool submittedSuccessfully;

  const AboutYouFormState({
    this.nationalId = '',
    this.firstName = '',
    this.lastName = '',
    this.otherNames = '',
    this.dateOfBirth = '',
    this.nationalIdError,
    this.firstNameError,
    this.lastNameError,
    this.otherNamesError,
    this.dobError,
    this.isValid = false,
    this.submittedSuccessfully = false,
  });

  AboutYouFormState copyWith({
    String? nationalId,
    String? firstName,
    String? lastName,
    String? otherNames,
    String? dateOfBirth,
    String? nationalIdError,
    String? firstNameError,
    String? lastNameError,
    String? otherNamesError,
    String? dobError,
    bool? isValid,
    bool? submittedSuccessfully,
  }) {
    return AboutYouFormState(
      nationalId: nationalId ?? this.nationalId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      otherNames: otherNames ?? this.otherNames,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nationalIdError: nationalIdError,
      firstNameError: firstNameError,
      lastNameError: lastNameError,
      otherNamesError: otherNamesError,
      dobError: dobError,
      isValid: isValid ?? this.isValid,
      submittedSuccessfully:
          submittedSuccessfully ?? this.submittedSuccessfully,
    );
  }

  @override
  List<Object?> get props => [
        nationalId,
        firstName,
        lastName,
        otherNames,
        dateOfBirth,
        nationalIdError,
        firstNameError,
        lastNameError,
        otherNamesError,
        dobError,
        isValid,
        submittedSuccessfully,
      ];
}
