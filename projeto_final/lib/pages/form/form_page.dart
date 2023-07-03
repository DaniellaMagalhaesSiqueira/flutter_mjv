import 'package:flutter/material.dart';
import 'package:projeto_final/components/icon_button_component.dart';
import 'package:projeto_final/components/menu_bar_component.dart';
import 'package:projeto_final/components/spacer_component.dart';
import 'package:projeto_final/entities/category_enum.dart';
import 'package:projeto_final/pages/home/home_page.dart';
import 'package:projeto_final/providers/recipe_provider.dart';
import 'package:provider/provider.dart';
import '../../entities/recipe_entity.dart';
import '../../services/image_service.dart';
import 'form_components/text_component.dart';
import 'package:uuid/uuid.dart';

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
  late List<RecipeEntity> list;
  late RecipeProvider store;
  late String _image;
  late RecipeEntity recipe;


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
    _image = '';
    recipe = RecipeEntity(uuid: '0000', title: 'title', ingredients: ['ingredients'], description: 'description', category: CategoryEnum.drinks, image: '');

  }

  void _addTextField() {
    setState(() {
      _ingredientController++;
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


  void handleSubmit(BuildContext context){
    final isValido = _formKey.currentState!.validate();
    if(isValido){
    List<String> ingredients = _ingredientControllers.map((e) => e.text).toList();
      final recipe = RecipeEntity(
        uuid: const Uuid().v4(),
        title: _titleController.text,
        ingredients: ingredients,
        description: _discriptionController.text,
        isVegan: _isVegan,
        isSugarFree: _isSugarFree,
        isVegetarian: _isVegetarian,
        isMilkFree: _isMilkFree,
        category: _category,
        image: _image,
      );
      setState(() {
        list.add(recipe);
        store.listRecipes = list;
      });
      
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  Widget putImage() {
    if (recipe.image != null || recipe.image != '') {
      return Image.memory(
        ImageService().decodeBase64(recipe.image!),
        fit: BoxFit.cover,
      );
    }
    return const Icon(Icons.image_search, size: 100);
  }
  @override
  Widget build(BuildContext context) {
    store = Provider.of<RecipeProvider>(context);
    list = store.listRecipes;
    final List<DropdownMenuItem<CategoryEnum>> _categories = CategoryEnum.values
        .map((e) => DropdownMenuItem<CategoryEnum>(
              value: e,
              child: Text(CategoryStatic.getString(e)),
            ))
        .toList();

    return Scaffold(
        appBar: MenuBarComponent(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top:15, bottom: 20),
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(right: 12, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Inserir Receita no Livro',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
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
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Digite um ingrediente ou o exclua da lista';
                        }
                      }
                    ),
                  const SpacerComponent(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _addTextField();
                          // for (var controller in _ingredientControllers) {

                          // }
                        },
                        
                        child: const Text('+ adicione'),
                      ),
                      const SpacerComponent(
                        isHorizontal: true,
                        size: 30,
                      ),
                      ElevatedButton(
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
                    validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Digite o modo de preparo';
                        }
                      }
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
                    ],
                  ),
                  Row(
                    children: [
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
                    onChanged: (value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                  ),
                  const SpacerComponent(),
                                
                  Stack(children: [
                     IconButtonComponent(
                    icon: Icons.image_search,
                    onPressed: (){},
                  ),
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.red[100],
                      child: putImage(),
                    ),
                  ],),
                 
                  const SpacerComponent(),

                  ElevatedButton(
                    onPressed: (){
                      handleSubmit(context);
                    },
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
