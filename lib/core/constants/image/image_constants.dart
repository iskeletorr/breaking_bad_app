class ImageConstant {
  static ImageConstant? _instance;
  static ImageConstant get instance {
    if (_instance == null) _instance = ImageConstant._init();
    return _instance!;
  }
  ImageConstant._init();

  String toPng(String name) => "asset/image/$name";
  String get logo => toPng("pictureName");
}
