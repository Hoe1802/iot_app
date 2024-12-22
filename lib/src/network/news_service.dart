// network/news_service.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../constant/news_model.dart';

class NewsApi {
  // for news home screen
  List<NewsModel> dataStore = [];

  Future<void> getNews() async {
    // Lấy dữ liệu từ offline_news.json
    dataStore = await _getOfflineArticles();
  }

  // Lấy các bài viết offline và chọn ngẫu nhiên 15 bài
  Future<List<NewsModel>> _getOfflineArticles() async {
    final String response =
        await rootBundle.loadString('assets/offline_news.json');
    List<dynamic> jsonData = jsonDecode(response);

    // Lọc những bài viết có ảnh hợp lệ (urlToImage không null và không rỗng)
    List<NewsModel> offlineArticles = jsonData
        .map((json) => NewsModel.fromJson(json))
        .where((article) =>
            article.urlToImage != null &&
            article.urlToImage!.isNotEmpty) // Lọc những bài có ảnh
        .toList();

    offlineArticles.shuffle(); // Trộn danh sách
    return offlineArticles.take(15).toList(); // Lấy 15 bài ngẫu nhiên
  }
}
