mixin EncryptEmailString {
  String encryptEmailString(email) {
    String result = '';
    String email_ = email;
    List<String> splitEmail_ = email_.split('@');
    String emailFirstIndex = email_[0].toLowerCase();
    result = "$emailFirstIndex******@${splitEmail_.last}";
    return result;
  }
}
