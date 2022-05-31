
import 'package:shared_preferences/shared_preferences.dart';

class GetLAng {
  static String lang = '';

  static Future<String?> getLang() async {
    final prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('locale') ?? 'en_US';
    return prefs.getString('locale');
  }
}