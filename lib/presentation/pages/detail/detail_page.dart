import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';

class Detail extends StatelessWidget {
  final Hit item;

  const Detail({super.key, required this.item});

  Snippet get info => item.snippet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text('Документ ${info.title}',
                style: GoogleFonts.ptSans(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
