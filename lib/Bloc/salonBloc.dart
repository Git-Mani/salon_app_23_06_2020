import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:saloonapp23062020/Bloc/StoreData.dart';
import 'package:saloonapp23062020/api/Saloon.dart';

class SalonBloc {
  int counter = 0;

  List<ServiceMapping> _salonService = [];

  final _salonListStreamController = StreamController<List<ServiceMapping>>();
  final _cartListStreamController = StreamController<ServiceMapping>();

//getter
  Stream<List<ServiceMapping>> get salonListStream =>
      _salonListStreamController.stream;

  StreamSink<ServiceMapping> get cartId => _cartListStreamController.sink;

  SalonBloc() {
    _salonListStreamController.add(_salonService);
    _cartListStreamController.stream.listen(_cartId);
//
//
  }

  _cartId(ServiceMapping id) {
    _salonService[1] = id;
    counter++;
    _salonListStreamController.add(_salonService);
  }

  void addToCart(id) {
    counter = counter + 1;
    _salonService.add(id);
    // _salonListStreamController.sink.add(_salonService);
  }

  void dispose() {
    _salonListStreamController.close();
    _cartListStreamController.close();
  }
}

class ServiceList extends SalonBloc {
  String name;
  double price;

  ServiceList(this.name, this.price);

  //setter

  SalonBloc sb = new SalonBloc();

//setter
  set ServiceName(String name) {
    this.name = name;
  }

  set ServicePrice(double price) {
    this.price = price;
  }

  //getter
  double get ServicePrice => this.price;

  //getter
  String get ServiceName => this.name;
}
