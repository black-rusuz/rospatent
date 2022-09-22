import 'package:flutter/material.dart';

import '../../providers/style.dart';
import '../../widgets/base_text_field.dart';
import '../home/home_page.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final number = TextEditingController();
  final dateFrom = TextEditingController();
  final dateTo = TextEditingController();
  final author = TextEditingController();
  final patentee = TextEditingController();
  final applicant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(true),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: ListView(
        children: [
          const SearchField(),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            controller: number,
            placeholder: 'Номер документа',
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            controller: dateFrom,
            placeholder: 'Дата публикации от',
            icon: const Icon(Icons.calendar_month_rounded),
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            controller: dateTo,
            placeholder: 'Дата публикации до',
            icon: const Icon(Icons.calendar_month_rounded),
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            controller: author,
            placeholder: 'Автор',
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            controller: patentee,
            placeholder: 'Патентообладатель',
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            controller: applicant,
            placeholder: 'Заявитель',
          ),
        ],
      ),
    );
  }
}
