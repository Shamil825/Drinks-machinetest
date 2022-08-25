import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:user_authetication/model/model.dart';

class HomeScreenController extends GetxController{
RxBool isempty=false.obs;

 @override
  void onInit()async {
    super.onInit();
   await get();
  }

 var  listDrinks=<Drinks?>[].obs;
  Future <Model?> get()async{
    try {
      var url=Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum");
      var response =await http.get(url);
      if(response.statusCode==200){
       var model=modelFromJson(response.body);
        listDrinks.value=model.drinks!;
        isempty.value=false;
       
      }
    } catch (e) {
      log(e.toString());
    }
  }
   Future  seach({required String searchKeyword })async{
     
    try {
      var url=Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$searchKeyword");
     
      var response =await http.get(url);
     
      if(response.statusCode==200){
        
       
       var model=modelFromJson(response.body);
       if(model.drinks==null){
         isempty.value=true ;
       }else{

        listDrinks.value=model.drinks!;
       isempty.value=false;
       }
     
      
      }
    } catch (e) {
      log(e.toString());
    }
  }


}
