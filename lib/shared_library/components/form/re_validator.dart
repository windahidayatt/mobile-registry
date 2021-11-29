class REValidator {
  static const String _regexEmail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String? validatorEmail(String? value) {
    if (value == '') {
      return 'Isian tidak boleh kosong';
    }

    if (value != null) {
      if (!RegExp(_regexEmail).hasMatch(value)) {
        return 'Gunakan format Email yang sesuai.';
      }
    }
  }

  static String? validatorPassword(String? value) {
    if (value == '') {
      return 'Isian tidak boleh kosong';
    }
  }
}
