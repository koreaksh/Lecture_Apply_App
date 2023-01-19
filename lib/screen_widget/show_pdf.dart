import 'package:url_launcher/url_launcher.dart';

Future<void> showPdf(String pdfUrl) async {
  final Uri url = Uri.parse("https://docs.google.com/viewer?url=$pdfUrl");
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}