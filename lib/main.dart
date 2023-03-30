import 'package:flutter/widgets.dart';
import 'package:nfc_and_qr_reader/view/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await App.withDependency());
}
