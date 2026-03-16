class LanguageService {
  static String apiLanguage = "en";

  static void setLanguage(String langCode) {
    if (langCode == "ar") {
      apiLanguage = "ar";
    } else {
      apiLanguage = "en";
    }
  }
}