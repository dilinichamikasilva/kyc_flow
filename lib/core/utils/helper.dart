class Helper {
  Helper._();

  // Validation

  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? name(String? value, {String fieldName = 'This field'}) {
    final requiredError = required(value, fieldName: fieldName);
    if (requiredError != null) return requiredError;
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    if (!nameRegex.hasMatch(value!.trim())) {
      return '$fieldName can only contain letters';
    }
    return null;
  }

  static String? optionalName(String? value,
      {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) return null;
    return name(value, fieldName: fieldName);
  }

  //nid
  static final RegExp _maldivesNidPattern = RegExp(r'^[A-Za-z0-9]{6,10}$');

  static String? nationalId(String? value) {
    final requiredError = required(value, fieldName: 'National ID Number');
    if (requiredError != null) return requiredError;
    if (!_maldivesNidPattern.hasMatch(value!.trim())) {
      return 'Enter a valid National ID Number';
    }
    return null;
  }

  static String? dateOfBirth18Plus(String? value) {
    final requiredError = required(value, fieldName: 'Date of birth');
    if (requiredError != null) return requiredError;

    final parts = value!.trim().split('/');
    if (parts.length != 3) {
      return 'Enter date as DD/MM/YYYY';
    }

    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) {
      return 'Enter date as DD/MM/YYYY';
    }

    final dob = DateTime(year, month, day);
    if (dob.day != day || dob.month != month || dob.year != year) {
      return 'Enter a valid date';
    }

    final now = DateTime.now();
    if (dob.isAfter(now)) {
      return 'Date of birth cannot be in the future';
    }

    var age = now.year - dob.year;
    final hadBirthdayThisYear =
        now.month > dob.month || (now.month == dob.month && now.day >= dob.day);
    if (!hadBirthdayThisYear) age--;

    if (age < 18) {
      return 'You must be at least 18 years old to register';
    }
    return null;
  }

  // date time formatting
  static String formatDateDDMMYYYY(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}
