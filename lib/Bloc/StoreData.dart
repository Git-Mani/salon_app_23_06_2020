import 'package:saloonapp23062020/api/Saloon.dart';
import 'package:saloonapp23062020/api/apiService.dart';

class Service2 {
  //bool _loading;

//  @override
//  void initState() {
//    // TODO: implement initState
//
//    _loading=true;
//
//    Services.getSaloons().then((salons){
//      setState(() {
//        _salons=salons;
//        //SaloonElement saloon=_salons[index];
//        //print(saloon.salonName);
//        _loading=false;
//      });
//    });
//  }

  int _id;

  Service2(this._id);

//setter
  set id(int id) {
    this._id = id;
  }

  //getter
  int get id => this._id;
}
