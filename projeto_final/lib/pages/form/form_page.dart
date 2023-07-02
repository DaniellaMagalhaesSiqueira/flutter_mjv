
import 'package:flutter/material.dart';
import 'package:projeto_final/components/elevated_button_component.dart';
import 'package:projeto_final/components/menu_bar_component.dart';
import 'package:projeto_final/components/spacer_component.dart';
import 'package:projeto_final/models/category_enum.dart';

import 'form_components/text_component.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _discriptionController = TextEditingController();
  List<TextEditingController> _ingredientControllers = [];
  int _ingredientController = 1;
  late bool _isSugarFree = false;
  late bool _isVegan = false;
  late bool _isVegetarian = false;
  late bool _isMilkFree = false;
  late CategoryEnum _category;

  @override
  void initState() {
    super.initState();
    _ingredientControllers.add(TextEditingController());
    _titleController.text = '';
    _discriptionController.text = '';
    _isSugarFree = false;
    _isVegan = false;
    _isVegetarian = false;
    _isMilkFree = false;
    _category = CategoryEnum.salads;
  }

  void _addTextField() {
    setState(() {
      _ingredientController++;
      print(_ingredientController);
      _ingredientControllers.add(TextEditingController());
    });
  }

  void _removeTextField() {
    setState(() {
      if (_ingredientController > 1) {
        _ingredientControllers.removeAt(_ingredientController - 1);
        _ingredientController--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<CategoryEnum>> _categories = CategoryEnum.values
        .map((e) => DropdownMenuItem<CategoryEnum>(
              value: e,
              child: Text(CategoryStatic.getString(e)),
            ))
        .toList();

    return Scaffold(
        appBar: MenuBarComponent(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(right: 12, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Cadastrar Receita',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  const SpacerComponent(),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        hintText: 'digite um título para a receita',
                        label: Text('Nome da Receita:')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite um nome.';
                      }
                      return null;
                    },
                  ),
                  const SpacerComponent(),
                  for (int i = 0; i < _ingredientController; i++)
                    TextFormField(
                      controller: _ingredientControllers[i],
                      decoration:
                          InputDecoration(labelText: 'ingredinte ${i + 1}'),
                      onTap: () {
                        print('faz alguma coisa');
                      },
                    ),
                  const SpacerComponent(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButtonComponent(
                        onPressed: () {
                          _addTextField();
                          for (var controller in _ingredientControllers) {}
                        },
                        child: const Text('+ adicione'),
                      ),
                      const SpacerComponent(
                        isHorizontal: true,
                        size: 30,
                      ),
                      ElevatedButtonComponent(
                        child: const Text('- remova'),
                        onPressed: () {
                          _removeTextField();
                        },
                      ),
                    ],
                  ),
                  const SpacerComponent(),
                  TextFormField(
                    maxLines: null,
                    controller: _discriptionController,
                    decoration: const InputDecoration(
                      hintText: 'descreva a receita',
                      label: Text('Modo de Fazer:'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SpacerComponent(),
                  Row(
                    children: [
                      Checkbox(
                        value: _isVegan,
                        onChanged: (value) {
                          setState(() {
                            _isVegan = value!;
                          });
                        },
                      ),
                      const TextComponent(text: 'Vegana'),
                      Checkbox(
                        value: _isVegetarian,
                        onChanged: (value) {
                          setState(() {
                            _isVegetarian = value!;
                          });
                        },
                      ),
                      const TextComponent(text: 'Vegetariana'),
                      Checkbox(
                        value: _isSugarFree,
                        onChanged: (value) {
                          setState(() {
                            _isSugarFree = value!;
                          });
                        },
                      ),
                      const TextComponent(text: 'Sem Açúcar'),
                      Checkbox(
                        value: _isMilkFree,
                        onChanged: (value) {
                          setState(() {
                            _isMilkFree = value!;
                          });
                        },
                      ),
                      const TextComponent(text: 'Sem Lactose'),
                    ],
                  ),
                  const SpacerComponent(),
                  DropdownButton<CategoryEnum>(
                      items: _categories,
                      value: _category,
                      elevation: 10,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      focusColor: Colors.amber[200],
                      onChanged: (value) {
                        setState(() {
                          _category = value!;
                        });
                      },
                    ),
                  const SpacerComponent(),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
