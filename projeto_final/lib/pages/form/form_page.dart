import 'package:flutter/material.dart';
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
  final List<DropdownMenuItem<CategoryEnum>> categories = CategoryEnum.values
      .map((e) => DropdownMenuItem<CategoryEnum>(
            value: e,
            child: Text(CategoryStatic.getString(e)),
          ))
      .toList();

  final _formKey = GlobalKey<FormState>();
  TextEditingController? _titleController;
  TextEditingController? _discriptionController;
  // ignore: prefer_final_fields
  List<TextEditingController>? _ingredientControllers;
  int _ingredientController = 1;
  late bool _isSugarFree = false;
  late bool _isVegan = false;
  late bool _isVegetarian = false;
  late bool _isMilkFree = false;
  late CategoryEnum _category;
  late List<RecipeEntity> list;
  late RecipeProvider store;
  RecipeProvider? storeNoListen;
  late String _image;
  late bool isEdit = false;
  String _title = 'Nova Receita';
  late RecipeEntity _recipe;
  @override
  void initState() {
    super.initState();
    // _titleController.text = '';
    // _discriptionController.text = '';
    _isSugarFree = false;
    _isVegan = false;
    _isVegetarian = false;
    _isMilkFree = false;
    _category = CategoryEnum.salads;
    _image = '';
    final storeNoListen = Provider.of<RecipeProvider>(context, listen: false);
    // final RecipeEntity recipeByRoute = ModalRoute.of(context)?.settings.arguments as RecipeEntity;
    // print(recipeByRoute.description);
    _ingredientControllers = [];
    final recipe = storeNoListen.recipeSelected;
    list = storeNoListen.listRecipes;
    if (recipe != null) {
      _recipe = recipe;
      isEdit = true;
      _titleController = TextEditingController(text: recipe.title);
      _title = recipe.title;
      _discriptionController = TextEditingController(text: recipe.description);
      for (String ingredient in recipe.ingredients) {
        _ingredientControllers!.add(TextEditingController(text: ingredient));
        _ingredientController ++;
      }
      _isMilkFree = recipe.isMilkFree;
      _isSugarFree = recipe.isSugarFree;
      _isVegan = recipe.isVegan;
      _isVegetarian = recipe.isVegetarian;
      _category = recipe.category;
    } else {
      _titleController = TextEditingController();
      _discriptionController = TextEditingController();
      _ingredientControllers!.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _discriptionController?.dispose();
    _ingredientControllers!.map((e) => e.dispose());
    // storeNoListen?.dispose();
    super.dispose();
  }

  void _addTextField() {
    setState(() {
      _ingredientController++;
      _ingredientControllers!.add(TextEditingController());
    });
  }

  void _removeTextField() {
    setState(() {
      if (_ingredientController > 1) {
        _ingredientController--;
        _ingredientControllers!.removeAt(_ingredientController-1);
      }
    });
  }

  void handleSubmit(BuildContext context) {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      List<String> ingredients =
          _ingredientControllers!.map((e) => e.text).toList();
      final recipeAlterado = RecipeEntity(
        uuid: isEdit ? _recipe.uuid : const Uuid().v4(),
        title: _titleController!.text,
        ingredients: ingredients,
        description: _discriptionController!.text,
        isVegan: _isVegan,
        isSugarFree: _isSugarFree,
        isVegetarian: _isVegetarian,
        isMilkFree: _isMilkFree,
        category: _category,
        image: _image,
      );
      setState(() {
        if (isEdit) {
          list.map((e) {
            if(e.uuid == recipeAlterado.uuid){
              e = recipeAlterado;
              print(CategoryStatic.getString(e.category));
            }
          },);
          // store.changeRecipe(recipe);
          // store.listRecipes.map(((e) {
          //   if(e.uuid == recipe.uuid){
          //     e = recipe;
          //   }
          // }));
        } else {
          list.add(recipeAlterado);
        }
          store.listRecipes = list;
      });
      store.recipeSelected = null;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  insertImage() async {
    // final pickerService = PickerService();
    // final image = await pickerService.getImage(ImageSource.gallery);
    // if (image != null) {
    //   final base64 = pickerService.base64(await image.readAsBytes());
    //   store.selecionado!.image = base64;
    //   store.atualizarItemAfazer(idx!);
    // }
  }

  Widget putImage() {
    if (storeNoListen != null) {
      if (storeNoListen!.recipeSelected != null) {
        return Image.memory(
          ImageService().decodeBase64(storeNoListen!.recipeSelected!.image!),
          fit: BoxFit.cover,
        );
      }
    }
    return const Icon(Icons.image_search, size: 50);
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<RecipeProvider>(context);

    return Scaffold(
        appBar: MenuBarComponent(
          isHome: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(right: 12, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700)),
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
                  for (int i = 0; i < _ingredientControllers!.length; i++)
                    TextFormField(
                        controller: _ingredientControllers![i],
                        decoration:
                            InputDecoration(labelText: 'ingredinte ${i + 1}'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite um ingrediente ou o exclua da lista';
                          }
                        }),
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
                        if (value == null || value.isEmpty) {
                          return 'Digite o modo de preparo';
                        }
                      }),
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
                    items: categories,
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
                  Container(
                    height: 150,
                    width: 250,
                    child: Card(
                      child: putImage(),
                    ),
                  ),
                  const SpacerComponent(),
                  ElevatedButton(
                    onPressed: () {
                      handleSubmit(context);
                    },
                    child: Text(isEdit ? 'Atualizar' : 'Salvar'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
