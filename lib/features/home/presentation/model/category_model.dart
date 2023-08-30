class CategoryModel {
  int id;
  String name;
  String banner;
  String icon;
  int numberOfChildren;
  CategoryModelLinks links;

  CategoryModel({
    required this.id,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
    required this.links,
  });
}

class CategoryModelLinks {
  String products;
  String subCategories;

  CategoryModelLinks({required this.products, required this.subCategories});
}
