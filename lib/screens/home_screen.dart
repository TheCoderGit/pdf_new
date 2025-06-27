import 'package:flutter/material.dart';
import 'package:pdf_new/feature/files_list/file_item.dart';
import 'package:pdf_new/feature/files_list/widget/files_list_widget.dart';
import 'package:pdf_new/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../feature/storage_permission/provider/storage_permission_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    // Trigger the permission check using Riverpod.
    ref.read(storagePermissionProvider.future);
  }

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
