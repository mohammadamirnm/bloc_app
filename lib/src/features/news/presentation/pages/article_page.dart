import 'package:bloc_app/src/helpers/context_extension.dart';
import 'package:flutter/material.dart';

import '../../data/entities/news.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.news});

  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                news.title,
                style: context.theme.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                news.desc,
                style: context.theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
