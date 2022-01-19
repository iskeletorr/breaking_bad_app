abstract class INavigationService{
  Future<void> navigateToPage({String? path,Object? object}); // Object? object
  Future<void> navigateToPageClear({String? path,Object? object}); // Object? object

}