import 'package:bloc_app/src/features/news/data/exceptions/news_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/news.dart';

class NewsRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('news');

  Stream<QuerySnapshot> getStream() {
    try {
      return collection.snapshots();
    } catch (_) {
      throw NewsException();
    }
  }

  Future<void> updateNews(News news) async {
    await collection.doc(news.id).set(news.toJson());
  }
}
