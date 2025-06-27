import 'package:flutter/material.dart';
import 'package:pdf_new/feature/files_list/file_item.dart';
import 'package:pdf_new/feature/files_list/widget/files_list_widget.dart';
import 'package:pdf_new/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.homeTitle),
      ),
      body: Center(
        child: FilesListWidget(files: [
          FileItem(name: 'Document1.pdf', type: 'pdf', date: DateTime.now()),
          FileItem(name: 'Image1.png', type: 'img', date: DateTime.now()),
          FileItem(name: 'Document2.docx', type: 'doc', date: DateTime.now()),
        ]),
      ),
    );
  }
}
