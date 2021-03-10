import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = 'ISLOGGEDIN';
  static String sharedPreferenceUserNameKey = 'USERNAMEKEY';
  static String sharedPreferenceUserEmailKey = 'USEREMAILKEY';
  static String sharedPReferenceIdOrcamentoKey = 'IDORCAMENTOKEY';

  // saving data to SharedPreference

  static Future<void> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<void> saveUserNameSharedPreference(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<void> saveUserEmailSharedPreference(String userEmail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  // getting data from SharedPreference

  static Future<bool> getUserLoggedInSharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserEmailKey);
  }

  // remove data from SharedPreference
  static Future<void> removeUserEmailSharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(sharedPreferenceUserLoggedInKey);
    return await prefs.remove(sharedPreferenceUserEmailKey);
  }

  // save ID ORCAMENTO
  static Future<void> saveIdOrcamentoInSharedPreference(
      String isIdOrcamento) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPReferenceIdOrcamentoKey, isIdOrcamento);
  }

  static Future<String> getIdOrcamentoInSharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPReferenceIdOrcamentoKey);
  }

}