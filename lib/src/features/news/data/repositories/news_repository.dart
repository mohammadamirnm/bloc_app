import 'package:bloc_app/src/features/news/data/exceptions/news_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/news.dart';

class NewsRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Stream<List<News>> getStream() {
    try {
      CollectionReference<Map<String, dynamic>> collection =
          FirebaseFirestore.instance.collection('news');
      return collection.snapshots().map(
          (QuerySnapshot<Map<String, dynamic>> event) => event.docs
              .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                  News.fromJson(doc.data()))
              .toList());
    } catch (_) {
      throw NewsException();
    }
  }

  Future<void> updateNews(News news) async {
    await _instance.collection('news').doc(news.id).set(news.toJson());
  }
}
