import 'package:http/http.dart' as http;
import 'Saloon.dart';

class Services {
  static const String url = "https://salonapi.herokuapp.com/api/v1/salon";

//  static Future<List<FileElement>> getFile() async{
//
//    try{
//      final response =await http.get(url);
//      final Saloon saloon1 = saloonFromJson(response.body);
//      List<Salon> salons=saloon1.salons;
//
//      FileElement file= salons[2] as FileElement;
//
//      print("*************");
//      print(file.id);
//
//
//    }catch(e){
//      return List<FileElement>();
//    }
//
//  }

//  static Future <List<Salon>> getSaloons() async{
//
//    try{
//      final response =await http.get(url);
//      final Saloon saloon1 = saloonFromJson(response.body);
//      List<Salon> salons=saloon1.salons;
////      print("*************");
////      print(salons[1].file[1].salonId);
//      return salons;
//    }catch(e){
//      return List<Salon>();
//    }
//
//  }
  static Future<List<Salon>> getDetail() async {
    try {
      final response = await http.get(url);
      final Saloon saloon1 = saloonFromJson(response.body);
      List<Salon> salons = saloon1.salons;

      //print("*************");
      //  print(salons[1].file[1].salonId);
      return salons;
    } catch (e) {
      return List<Salon>();
    }
  }

  static Future<List<ServiceMapping>> getService(int i) async {
    try {
      final response = await http.get(url);
      final Saloon saloon1 = saloonFromJson(response.body);
      List<Salon> salons = saloon1.salons;

      List<ServiceMapping> serviceList = salons[i - 1].serviceMappings;

      return serviceList;
    } catch (e) {
      return List<ServiceMapping>();
    }
  }
}
