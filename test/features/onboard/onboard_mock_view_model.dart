// import 'package:dio/dio.dart';
// import 'package:flutter_application_1/core/constants/enum/network_type_enum.dart';
// import 'package:flutter_application_1/core/init/network/core_dio.dart';
// import 'package:flutter_application_1/view/auth/onboard/model/on_board_model.dart';
// import 'package:flutter_application_1/core/init/network/i_core_dio.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_1/view/auth/onboard/view-model/on_board_view_model.dart';

// import '../../core/network/dio_mock_model.dart';

// class OnBoardMockViewModel implements OnBoardViewModel {
//   @override
//   BuildContext? context;

//   IStringHelper? stringHelper;

//   @override
//   ICoreDio? coreDio;

//   @override
//   late int currentIndex;

//   @override
//    bool isLoading = false;

//   @override
//   late List<OnBoardModel> onBoardItems;

//   @override
//   void changeCurrentIndex(int value) {
//     currentIndex = value;
//   }

//   @override
//   void changeLoading() {}

//   // @override
//   // Future<void> completeToOnBoard() {
//   //   throw UnimplementedError();
//   // }

//   @override
//   void init() {
//     coreDio = CoreDio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
//     stringHelper = MockStringHelper();
//   }
//   Future <void> onBoardGetModels() async{
//     final response = await coreDio!.fetchType<List<PostModel>,PostModel>("/posts", type: NetworkTypes.GET, parseModel: PostModel());
//     if (response.data is List) {
//       onBoardItems = response.data!.map((e) => OnBoardModel(stringHelper!.toUpper(e.title).toString())).toList(); 
//       // videoda .toList().cast<OnBoardModel>(); yapıyor ama zaten onboardmodel listesi döndüğü için ben yapmadım.
//     }
//   }

//   Future<void> getServiceRequest() async {
//     isLoading = true;
//     await onBoardGetModels();
//     isLoading = false;
//   }
//   @override
//   void setContext(BuildContext context) {}
// }


// abstract class IStringHelper {
//   String? toUpper(String? data);
// }

// class MockStringHelper extends IStringHelper {
//   @override
//   String? toUpper(String? data) {
//     return data!.toUpperCase();
//   }
// }