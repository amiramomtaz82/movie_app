class Validation {///////
  // 🔹 Name Validation
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  // 🔹 Phone Validation (Egypt format 🇪🇬)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    final phoneRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid Egyptian phone number";
    }

    return null;
  }

  // 🔹 Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(
      r'^[\w\.\+-]+@[a-zA-Z\d-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }

    return null;
  }

  // 🔹 Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }
  static String? validateConfirmPassword(
      String? value,
      String password,
      ) {
    if (value == null || value.isEmpty) {
      return "Please re-enter password";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }
}