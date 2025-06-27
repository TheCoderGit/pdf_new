import 'package:flutter/material.dart';
import 'package:pdf_new/feature/files_list/file_item.dart';



class FilesListWidget extends StatefulWidget {
  final List<FileItem> files;
  const FilesListWidget({super.key, required this.files});

  @override
  State<FilesListWidget> createState() => _FilesListWidgetState();
}

class _FilesListWidgetState extends State<FilesListWidget> {
  String searchQuery = '';
  String? selectedType;
  final List<String> fileTypes = ['pdf', 'doc', 'img'];

  @override
  Widget build(BuildContext context) {
    final filteredFiles = widget.files.where((file) {
      final matchesSearch = file.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesType = selectedType == null || file.type == selectedType;
      return matchesSearch && matchesType;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search files',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => setState(() => searchQuery = value),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: const Text('All'),
                selected: selectedType == null,
                onSelected: (_) => setState(() => selectedType = null),
              ),
              ...fileTypes.map((type) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(type.toUpperCase()),
                  selected: selectedType == type,
                  onSelected: (_) => setState(() => selectedType = type),
                ),
              )),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: filteredFiles.length,
            itemBuilder: (context, index) {
              final file = filteredFiles[index];
              return ListTile(
                leading: const Icon(Icons.insert_drive_file),
                title: Text(file.name),
                subtitle: Text('${file.type} - ${file.date.toLocal()}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
