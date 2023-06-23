

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/afazer_entity.dart';

class AfazerService {

  final _key = 'KEY_AFAZERES';

  Future<void> salvar(List<AfazeresEntity> itens) async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<Map<String, dynamic>> lista = AfazeresEntity.toJsonList(itens);
    // String listJson = jsonEncode(lista);
    // await prefs.setString(_key, listJson);
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String listJson = jsonEncode(itens);
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