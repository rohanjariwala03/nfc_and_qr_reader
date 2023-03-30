import 'dart:io';
import 'package:nfc_and_qr_reader/repository/repository.dart';
import 'package:nfc_and_qr_reader/theme.dart';
import 'package:nfc_and_qr_reader/view/common/form_row.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/NfcReaderScreen.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/widgets/ndef_write.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/widgets/ndef_write_lock.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/widgets/tag_read.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static Future<Widget> withDependency() async {
    final repo = await Repository.createInstance();
    return MultiProvider(
      providers: [
        Provider<Repository>.value(
          value: repo,
        ),
      ],
      child: App(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Home(),
      theme: themeData(Brightness.light),
      darkTheme: themeData(Brightness.dark),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => const NfcReader(),
              )),
              child: const Text('Nfc Reader')
          ),
        ],
      ),
    );
  }
}




