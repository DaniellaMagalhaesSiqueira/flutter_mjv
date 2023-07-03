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

  static CategoryEnum getEnum(String category){
    switch (category) {
      case 'Saladas e Molhos':
        return CategoryEnum.salads;
      case 'Salgados':
        return CategoryEnum.savory;
      case 'Doces e Bolos':
        return CategoryEnum.cakes;
      case 'Carnes':
        return CategoryEnum.meat;
      case 'Aves':
        return CategoryEnum.birds;
      case 'Sopas e Caldos':
        return CategoryEnum.soups;
      case 'Massas':
        return CategoryEnum.pastas;
      case 'Drinks e Sucos':
        return CategoryEnum.drinks;
      case 'Peixes':
        return CategoryEnum.fish;
      default:
        throw ArgumentError('Invalid category value: $category');
    }
  }
}
