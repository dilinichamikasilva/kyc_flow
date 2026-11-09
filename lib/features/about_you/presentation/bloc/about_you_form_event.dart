part of 'about_you_form_bloc.dart';

abstract class AboutYouFormEvent extends Equatable {
  const AboutYouFormEvent();

  @override
  List<Object?> get props => [];
}

class NationalIdChanged extends AboutYouFormEvent {
  final String value;
  const NationalIdChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FirstNameChanged extends AboutYouFormEvent {
  final String value;
  const FirstNameChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class LastNameChanged extends AboutYouFormEvent {
  final String value;
  const LastNameChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class OtherNamesChanged extends AboutYouFormEvent {
  final String value;
  const OtherNamesChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class DateOfBirthChanged extends AboutYouFormEvent {
  final String value;
  const DateOfBirthChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class FormSubmitted extends AboutYouFormEvent {
  const FormSubmitted();
}
