import 'package:flutter/cupertino.dart';
import 'package:safewheel/data/model/pokemons_details_model.dart';
import 'package:safewheel/data/model/pokemons_list_model.dart';
import 'package:safewheel/data/network/api_response.dart';
import 'my_repository.dart';

class MyViewModel with ChangeNotifier {
  final _myRepo = MyRepository();

  ApiResponse<ListModel> apiResponse = ApiResponse.loading();

  setData(ApiResponse<ListModel> response) {
    apiResponse = response;
    notifyListeners();
  }

  Future fetchListData() async {
    setData(ApiResponse.loading());
    _myRepo.getListData().then((value) {
      setData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setData(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<DetailsModel> detailsResponse = ApiResponse.loading();
  setDetailsData(ApiResponse<DetailsModel> response) {
    detailsResponse = response;
    notifyListeners();
  }

  Future fetchDetailsData(String id, String name) async {
    setData(ApiResponse.loading());
    _myRepo.getDetailsData(id,name).then((value) {
      setDetailsData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setDetailsData(ApiResponse.error(error.toString()));
    });
  }
}
