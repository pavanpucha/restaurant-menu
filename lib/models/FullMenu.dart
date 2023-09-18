

import '../common/strings.dart';

class FullMenu {
  List<Category>? categories;

  FullMenu({required this.categories});
}

class SandwichDetails {
  bool? isHot;
  List<String> breadType;

  SandwichDetails({this.isHot, required this.breadType});
}

class ItemDetails {
  String? name;
  int? price;
  int? id;
  String? imageAsset;
  bool? isSandwich;
  SandwichDetails? sandwichDetails;

  ItemDetails(
      {this.name,
      this.price,
      this.id,
      required this.isSandwich,
        required this.imageAsset,
      this.sandwichDetails});
}

class Category {
  String? categoryName;
  String? categoryDescription;
  List<ItemDetails>? categoryItems;
  bool? isFull;
  bool? upgrade;

  Category({required this.categoryName, this.categoryItems, this.categoryDescription});
}


FullMenu generateMockData() {
  final appetizers = List.generate(
      6,
      (index) => ItemDetails(
          isSandwich: false,
          name: appNames[index],
          id: index,
          imageAsset: "images/appetizer.png",
          price: appPrices[index]));

  final entrees = List.generate(
      5,
      (index) => ItemDetails(
          isSandwich: false,
          name: entreeNames[index],
          id: index,
          imageAsset: "images/entree.jpeg",
          price: entreePrices[index]));
  final sandwiches = List.generate(
      coldSandwiches.length,
      (index) => ItemDetails(
          isSandwich: true,
          imageAsset: "images/sandwich.jpeg",
          name: coldSandwiches[index],
          sandwichDetails: SandwichDetails(isHot: false, breadType: ["Whole Wheat" , "Sour Dough" , "Rye"]),

          price: coldSandwichPrices[index]));
  final hotSandwiches = List.generate(
      hotSandwichNames.length,
      (index) => ItemDetails(
          isSandwich: true,
          imageAsset: "images/sandwich.jpeg",

          sandwichDetails: SandwichDetails(isHot: true, breadType: ["Whole Wheat" , "Cheese & Onion Bun"]),
          name: hotSandwichNames[index],
          price: hotSandwichPrices[index]));
  final soupSalads = List.generate(
      soupSaladNames.length,
      (index) => ItemDetails(
          isSandwich: false,
          imageAsset: "images/soup.jpg",
          name: soupSaladNames[index],
          price: soupSaladPrices[index]));
  final fajitas = List.generate(
      fajitaNames.length,
      (index) => ItemDetails(
        imageAsset: "images/fajitas.jpg",
          isSandwich: false,
          name: fajitaNames[index],
          price: fajitaPrices[index]));
  final quiche = List.generate(
      quichesNames.length,
      (index) => ItemDetails(
        imageAsset: "images/qiche.jpg",
          isSandwich: false,
          name: quichesNames[index],
          price: 895));
  final greenSalad = List.generate(
      greenSaladNames.length,
      (index) => ItemDetails(
          isSandwich: false,
          imageAsset: "images/greensalad.jpg",
          name: greenSaladNames[index],
          price: greenSaladPrices[index]));

  final List<Category> allCats = List.from([
    Category(categoryName: "Appetizers", categoryItems: appetizers),
    Category(categoryName: "Entrees", categoryItems: entrees),
    Category(categoryName: "Cold Sandwich", categoryItems: sandwiches, categoryDescription: sandwich_description ),
    Category(categoryName: "Hot Sandwich", categoryItems: hotSandwiches),
    Category(categoryName: "Soup \& Salad Combos", categoryItems: soupSalads),
    Category(categoryName: "Fajitas", categoryItems: fajitas),
    Category(categoryName: "Quiche ", categoryItems: quiche),
    Category(categoryName: "Green Salads", categoryItems: greenSalad)
  ]);
  return FullMenu(categories: allCats);
  //MenuItem(name: "Iceberg Wedge Salad with House Cured Bacon", price:  750, id: 1 );
}

