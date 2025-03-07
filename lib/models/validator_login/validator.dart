class Validator {
  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    final regex = RegExp(r"^[a-zA-ZÀ-Ỹà-ỹ\s]+$");
    if (!regex.hasMatch(value)) {
      return "Name is invalid";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    final regex = RegExp(r"^(0[3|5|7|8|9])\d{8}$");
    if (!regex.hasMatch(value)) {
      return "Phone number is invalid";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!regex.hasMatch(value)) {
      return "Email is invalid";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    if (value.length < 8 || value.length > 20) {
      return "This field must be between 8 and 20 characters";
    }

    final regex = RegExp(
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$",
    );
    if (!regex.hasMatch(value)) {
      return "Password does not meet requirements"; //
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    if (value != password) {
      return "Password does not match";
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
