// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecipeModel {
  late String appLabel;
  late String appImgUrl;
  late double appCalories;
  late String appURL;
  RecipeModel({
    this.appLabel = "LABEL",
    this.appImgUrl = "IMAGE",
    this.appCalories = 0.000,
    this.appURL = "url",
  });
  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      appLabel: recipe['label'],
      appCalories: recipe['calories'],
      appImgUrl: recipe['image'],
      appURL: recipe['url'],
    );
  }
}
