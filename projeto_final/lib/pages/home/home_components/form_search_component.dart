import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../entities/recipe_entity.dart';
import '../../../providers/recipe_provider.dart';

class FormSearchComponent extends StatefulWidget {

  final List<RecipeEntity> list;
  final String text;

  const FormSearchComponent({super.key, required this.list, this.text = ''});

  @override
  State<FormSearchComponent> createState() => _FormSearchComponentState();
}

class _FormSearchComponentState extends State<FormSearchComponent> {
  late RecipeProvider store;
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();


  void _handleSubmit() {
     if (_formKey.currentState!.validate()) {
      // Executar a lógica de envio de formulário aqui
      String searchTerm = _searchController.text;
      final resultList = widget.list.where((e) => e.title.toLowerCase().contains(searchTerm.toLowerCase())).toList();
      store.filter = resultList;
      print('Formulário enviado! Termo de busca: $searchTerm');
      setState(() {
        _searchController.text = widget.text;
      });
    }
  }


    @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    store = Provider.of<RecipeProvider>(context);
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.enter)){
          _handleSubmit();
        }
      },
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            label: Text('Buscar Receita:'),
            
          ),
        ),
      ),
    );
  }
  
  
}
