import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/api_client/api_client.dart';
import 'package:machine_test/constants/api_config.dart';
import 'package:machine_test/models/profile_model.dart';

enum AppState { loading, complete, error }

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {
    getUsers();
  }

  List<Media> posts = [];
  int postCount = 0;

  final _apiClient = Api();
  String _errorMessage = '';
  AppState _state = AppState.loading;

  AppState get state => _state;

  String get errorMessage => _errorMessage;

  void getUsers() async {
    try {
      _state = AppState.loading;
      notifyListeners();
      var token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I";
      var url = ApiConfig.baseUrl + ApiEndPoint.getMedia;
      final response = await _apiClient.client<dynamic>(
        RequestOptions(
            method: 'GET',
            path: url,
            headers: {"Authorization": "Bearer $token"}),
      );
      response.data['media'].map((e) => posts.add(Media.fromJson(e))).toList();
      postCount = response.data['postCount'] ?? 0;
      _state = AppState.complete;
    } catch (error) {
      _errorMessage = error.toString();
      _state = AppState.error;
    } finally {
      notifyListeners();
    }
  }
}
