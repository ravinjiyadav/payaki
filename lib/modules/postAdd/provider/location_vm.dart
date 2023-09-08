import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/repository/LocationRepository.dart';
import '../../../network/model/response/location/city_list_response.dart';

class LocationVm extends ChangeNotifier {
  final LocationRepository locationRepository = LocationRepository();

  List<Data>? cityList;
  bool isLoading = true;

 cityListApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    locationRepository
        .cityList(BasicRequest(
        name: Endpoints.location.getCities,
        param: Param()))
        .then((value) {
      cityList = value.data;
      isLoading = false;
      notifyListeners();

      logD("length ${cityList?.length}");
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isLoading = false;
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }
}
