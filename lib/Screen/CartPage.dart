import 'package:saloonapp23062020/Screen/DetailPage.dart';
import 'package:saloonapp23062020/api/Saloon.dart';
import 'package:flutter/material.dart';
import '';
import 'TimeSlot.dart';

class CartCheckOut extends StatefulWidget {
  List<ServiceMapping> _cart = [];
  List<Salon> _salon = [];
  int total;

  CartCheckOut(this._cart, this._salon, this.total);

  @override
  _CartCheckOutState createState() => _CartCheckOutState();
}

class _CartCheckOutState extends State<CartCheckOut> {
  //_CartCheckOutState(this._cart, this._salon, this.total);
  // List <Cart> _salons=[];
  bool _loading = false;
  List<ServiceMapping> _cart = [];
  List<Salon> _salon = [];
  int total;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    bool select = false;
    bool b = false;

    if (widget._cart.isNotEmpty) {
      b = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => detailList()),
            );
          },
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: b,
        child: BottomAppBar(
          child: RaisedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext b) {
                    return Container(
                        // color: Colors.red,
                        //  height: 800,
                        child: TimeSlot(_salon));
                  });
            },
            icon: Icon(Icons.arrow_forward),
            label: Text("Click to proceed"),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget._cart.length,
              itemBuilder: (context, index) {
                var item = widget._cart[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      children: [
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Service Name:" + item.serviceName.name),
                              Text("price :" + item.price.toString()),
                              Text(item.category.toString()),
                            ],
                          ),
                          trailing: GestureDetector(
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onTap: () {
                                setState(() {
                                  _cart.remove(item);
                                  total--;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
