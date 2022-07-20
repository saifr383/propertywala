import 'package:get/get.dart';

class FilterController extends GetxController{
  List<String> type = ['All', "Residential", "Commercial"];
  var subtype = ['All'].obs;
  List<String> rtype = ["All", "Plot", "House", 'Appartment'];
  List<String> ctype = ["All", "Plot", "Office", 'ShowRoom'];
  List<String> country = ["All","DHA Lahore", "DHA Multan",'DHA Bahawalpur','DHA Gujranwala','DHA Quetta','DHA Islamabad','DHA Karachi','DHA Peshawar','Others'];
  var propertytype='All'.obs;
  var selectedcity='All'.obs;
  var subpropertytype='All'.obs;
}