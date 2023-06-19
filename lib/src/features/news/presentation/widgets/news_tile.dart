import 'package:bloc_app/src/features/news/presentation/pages/article_page.dart';
import 'package:bloc_app/src/helpers/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/entities/news.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<ArticlePage>(
          builder: (BuildContext context) => ArticlePage(news: news),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 250,
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      news.title,
                      style: context.theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      news.shortDesc,
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 210,
                  width: 170,
                  child: Image.network(
                    news.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Center(child: Text('label_no_image'.tr())),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
