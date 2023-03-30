import 'package:flutter/material.dart';
import 'package:nfc_and_qr_reader/view/common/form_row.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/widgets/ndef_write.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/widgets/ndef_write_lock.dart';
import 'package:nfc_and_qr_reader/view/nfc_view/widgets/tag_read.dart';

class NfcReader extends StatelessWidget {
  const NfcReader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Manager'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(2),
        children: [
          FormSection(children: [
            FormRow(
              title: const Text('Tag - Read'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => TagReadPage.withDependency(),
              )),
            ),
            FormRow(
              title: const Text('Ndef - Write'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => NdefWritePage.withDependency(),
              )),
            ),
            FormRow(
              title: const Text('Ndef - Write Lock'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => NdefWriteLockPage.withDependency(),
              )),
            ),
          ]),
        ],
      ),
    );
  }
}