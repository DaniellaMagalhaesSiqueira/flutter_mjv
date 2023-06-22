

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/afazer_entity.dart';

class AfazerService {

  final _key = 'KEY_AFAZER';

  Future<void> salvar(List<AfazeresEntity> item) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(AfazeresEntity.fromJsonList(item));
    await prefs.setString(_key, listJson);
  }

  Future<List<AfazeresEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if(listJson != null) {
      return AfazeresEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}