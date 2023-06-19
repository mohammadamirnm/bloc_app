import 'package:bloc/bloc.dart';
import 'package:bloc_app/src/features/news/data/entities/news.dart';
import 'package:bloc_app/src/features/news/data/exceptions/news_exception.dart';
import 'package:bloc_app/src/features/news/data/repositories/news_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({NewsRepository? newsRepository})
      : _newsRepository = newsRepository ?? NewsRepository(),
        super(const NewsState.initial());

  final NewsRepository _newsRepository;

  Future<void> initStream() async {
    try {
      _newsRepository.getStream().listen(
        (List<News> news) async {
          fetchNews(news);
        },
      );
    } on NewsException catch (newsException) {
      emit(NewsState.error(newsException.message ?? ''));
    } catch (e) {
      emit(NewsState.error(e.toString()));
    }
  }

  void fetchNews(List<News> news) {
    // This is in case it was a query taking time.
    emit(const NewsState.loading());

    emit(NewsState.loaded(news));
  }
}
