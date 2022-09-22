import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../providers/style.dart';
import '../../widgets/base_text_field.dart';
import '../home/home_page.dart';

class ExtendedSearch extends StatefulWidget {
  const ExtendedSearch({super.key});

  @override
  State<ExtendedSearch> createState() => _ExtendedSearchState();
}

class _ExtendedSearchState extends State<ExtendedSearch> {
  final controllerNum = TextEditingController();
  final controllerDateFrom = TextEditingController();
  final controllerDateTo = TextEditingController();
  final controllerAuthor = TextEditingController();
  final controllerPatentee = TextEditingController();
  final controllerApplicant = TextEditingController();

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
      body: Column(
        children: [
          const SearchField(),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            controller: controllerNum,
            placeholder: 'Номер документа',
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            controller: controllerDateFrom,
            placeholder: 'Дата публикации от',
            icon: const Icon(Icons.calendar_month_rounded),
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            controller: controllerDateTo,
            placeholder: 'Дата публикации до',
            icon: const Icon(Icons.calendar_month_rounded),
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            controller: controllerAuthor,
            placeholder: 'Автор',
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            controller: controllerPatentee,
            placeholder: 'Патентообладатель',
          ),
          BaseTextField(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            controller: controllerApplicant,
            placeholder: 'Заявитель',
          ),
        ],
      ),
    );
  }
}
