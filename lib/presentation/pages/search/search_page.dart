import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/base_button.dart';
import '../../widgets/base_text_field.dart';
import '../home/bloc/home_bloc.dart';
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
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: ListView(
        children: [
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
          BaseButton(
              title: 'Найти',
              onTap: () {
                context.read<HomeBloc>().add(HomeExtendedSearch(
                      number: number.text,
                      dateFrom: dateFrom.text,
                      dateTo: dateTo.text,
                      author: author.text,
                      patentee: patentee.text,
                    ));
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
