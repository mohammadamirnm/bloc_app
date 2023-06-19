import 'package:bloc_app/src/features/news/presentation/pages/article_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entities/news.dart';
import '../cubits/news/news_cubit.dart';
import '../widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().initStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (BuildContext context, NewsState state) => state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (String message) => Center(child: Text(message)),
          loaded: (List<News> news) => ListView.separated(
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NewsTile(
                news: news[index],
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(
              height: 25,
            ),
            itemCount: news.length,
          ),
        ),
      ),
    );
  }
}
