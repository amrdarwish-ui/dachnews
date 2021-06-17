import 'dart:wasm';

import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class UrlLuncher {
  Future<void> lunch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
