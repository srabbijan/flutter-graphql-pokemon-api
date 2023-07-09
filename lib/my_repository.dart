
import 'package:safewheel/data/model/pokemons_details_model.dart';
import 'package:safewheel/data/model/pokemons_list_model.dart';
import 'package:safewheel/data/network/NetworkAPiServices.dart';

class MyRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future getListData() async {
    try {
      dynamic response = await _apiServices.getList();
      return response = ListModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future getDetailsData(String id, String name) async {
    try {
      dynamic response = await _apiServices.getDetails(id,name);
      return response = DetailsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
