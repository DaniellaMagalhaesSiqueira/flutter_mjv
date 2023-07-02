enum CategoryEnum {
  salads,
  savory,
  cakes,
  meat,
  birds,
  soups,
  pastas,
  drinks,
  fish
}

class CategoryStatic {
  static const Map<CategoryEnum, String> _category = {
    CategoryEnum.salads: 'Saladas e Molhos',
    CategoryEnum.savory: 'Salgados',
    CategoryEnum.cakes: 'Doces e Bolos',
    CategoryEnum.meat: 'Carnes',
    CategoryEnum.birds: 'Aves',
    CategoryEnum.soups: 'Sopas e Caldos',
    CategoryEnum.pastas: 'Massas',
    CategoryEnum.drinks: 'Drinks e Sucos',
    CategoryEnum.fish: 'Peixes',
  };

  static String getString(CategoryEnum category) {
    return _category[category] ?? 'Sem Categoria';
  }

  // static List<String> getCategories(){
  //   return CategoryEnum.values.map((description) => _category[description]!).toList();
  // }
}
