import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/controller/login_controller.dart';

import '../model/todo.dart';

class HomeController {
  Dio dio = Dio();

  Future<void> createTodo(
      {required String title,
      required bool isComplete,
      required VoidCallback callback}) async {
    if (title.isEmpty) return;
    try {
      final res = await dio.post("http://todo.trienss.id.vn/todo",
          data: {"title": title, "completed": isComplete},
          options: Options(headers: {
            "Authorization": "Bearer ${GlobalData.instance.token}"
          }));
      if (res.statusCode == 201) {
        callback.call();
      }
    } catch (e) {
      print("error: " + e.toString());
    }
  }

  Future<List<Todo>?> getTodos() async {
    try {
      final res = await dio.get("http://todo.trienss.id.vn/todo",
          queryParameters: {
            'page': 1,
            "limit": 100,
          },
          options: Options(headers: {
            "Authorization": "Bearer ${GlobalData.instance.token}"
          }));
      if (res.statusCode == 200) {
        final data = res.data;
        final List<Todo> todos = [];
        data['data'].forEach((element) {
          todos.add(Todo.fromJson(element));
        });
        return todos;
      }
    } catch (e) {
      print("error: " + e.toString());
      return [];
    }
  }
}
