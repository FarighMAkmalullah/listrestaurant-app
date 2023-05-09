import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restaurant_app/models/model.dart';
import 'package:restaurant_app/models/model-detail.dart';
import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  List<RestaurantModel> _restaurants = [];

  List<RestaurantModel> get restaurants => _restaurants;

  Future<void> fetchRestaurants() async {
    try {
      final response =
          await Dio().get('https://restaurant-api.dicoding.dev/list');
      if (response.statusCode == 200) {
        final data = response.data['restaurants'] as List<dynamic>;
        _restaurants =
            data.map((json) => RestaurantModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Gagal untuk memuat data dari Restaurant, silahkan cek koneksi Anda');
      }
    } catch (e) {
      throw Exception('Gagal untuk memuat data dari Restaurant: { $e }');
    }
  }

  RestaurantDetailModel? _restaurantDetail;

  RestaurantDetailModel? get restaurantDetail => _restaurantDetail;

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      final response =
          await Dio().get('https://restaurant-api.dicoding.dev/detail/$id');
      if (response.statusCode == 200) {
        print('https://restaurant-api.dicoding.dev/detail/$id');
        final data = response.data['restaurant'];
        print(data);
        _restaurantDetail = RestaurantDetailModel.fromJson(data);

        notifyListeners();
        print(_restaurantDetail);
      } else {
        throw Exception(
            'Gagal untuk memuat data dari Restaurant, silahkan cek koneksi Anda');
      }
    } catch (e) {
      throw Exception('Gagal untuk memuat data dari Restaurant: { $e }');
    }
  }
}
