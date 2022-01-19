// import 'package:flutter_test/flutter_test.dart';

// import 'onboard_mock_view_model.dart';
// main() {
//   OnBoardMockViewModel? mockViewModel; 
//   IStringHelper? stringHelper;
//   // diğer testimizde ICoreDio? service; service = _CoreDioMock(); ile interface kullanarak mocklamıştık.
//   // burada ise sınıf mocklamadan direk ana sınıfımız üzerine test yazıyoruz.

// setUp(() {
//   mockViewModel = OnBoardMockViewModel();
//   stringHelper = MockStringHelper();
//   mockViewModel!.init();
// });
//  test('String Helper Upper Case', () {
//    String text = "hello";
//    text = stringHelper!.toUpper(text)!;
//    expect(text.contains(RegExp("[A-Z\s]+")),true);  
//  });
//  test('OnBoard Get Models', () async {
//    await mockViewModel!.onBoardGetModels();
//    expect(mockViewModel!.onBoardItems,isNotNull); 
//  });
//  test('OnBoard Get Service Request', () async {
//    expect(mockViewModel!.isLoading,false); 
//    mockViewModel!.getServiceRequest();
//    expect(mockViewModel!.isLoading,true); 
//  });
//  test('OnBoard Change Current Index', () async {
//    mockViewModel!.changeCurrentIndex(5);
//    expect(5,mockViewModel!.currentIndex); 
//  });
// }

