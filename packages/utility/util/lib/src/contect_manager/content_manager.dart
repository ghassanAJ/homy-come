import 'package:url_launcher/url_launcher.dart';

class ContentManager {

 static Future<void> contactByPhone(String phone) async {
  final Uri callUri = Uri.parse('tel:$phone');

  if (await canLaunchUrl(callUri)) {
    await launchUrl(callUri, mode: LaunchMode.externalApplication);
  } 
}


static Future<void> contactByWhatsApp(String phone) async {
  final String whatsappNumber = phone.replaceAll(RegExp(r'[^0-9]'), '');
  final Uri whatsappUri = Uri.parse("https://wa.me/$whatsappNumber");

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  }
}
}
