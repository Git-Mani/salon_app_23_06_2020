import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloonapp23062020/Bloc/StoreData.dart';
import 'package:saloonapp23062020/Bloc/salonBloc.dart';
import 'package:saloonapp23062020/Screen/CartPage.dart';
import 'package:saloonapp23062020/api/Saloon.dart';
import 'package:saloonapp23062020/api/apiService.dart';

class detailList extends StatefulWidget {
  final id;
  final serviceMapping;

  const detailList({Key key, this.id, this.serviceMapping}) : super(key: key);

  //detailList ob=new detailList();

  @override
  _detailListState createState() => _detailListState();
}

class _detailListState extends State<detailList> {
  List<ServiceMapping> _cart = [];
  final SalonBloc _salonBloc = SalonBloc();
  int total = 0;
  bool showRaisedButtonBadge = true;

  //alwyz override this

  @override
  void dispose() {
    _salonBloc.dispose();
    super.dispose();
  }

  CarouselController buttonCarouselController = CarouselController();

  List<Salon> _salons = [];
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getDetail().then((salons) {
      setState(() {
        _salons = salons;
        // print(ob.id.toString() + "++++++");
        /* SaloonElement saloon = _salons[widget.id];
         print(saloon.salonName);
*/
        _loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      List<String> imageLinks = [];
      for (int i = 0; i < _salons[widget.id - 1].file.length; i++) {
        imageLinks.add((_salons[widget.id - 1].file[i].imageLink));
      }
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("saloon"),
              SizedBox(
                width: 150,
              ),
              Badge(
                badgeContent: Text("${total}"),
                badgeColor: Colors.deepOrangeAccent,
                toAnimate: true,
                position: BadgePosition.topRight(top: 0, right: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CartCheckOut(_cart, _salons, total)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                height: 200,
                width: 400,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Positioned(
                      height: 300,
                      width: 400,
                      child: Container(
                        padding: EdgeInsets.all(0.5),
                        margin: EdgeInsets.all(20),
                        height: 200,
                        width: 200,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 300.0,
                            initialPage: 0,
                            carouselController: buttonCarouselController,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            reverse: true,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 4),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 2000),
                            pauseAutoPlayInFiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                          ),

                          items: imageLinks.map((imageLink) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 05.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        imageLink,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ));
                              },
                            );
                          }).toList(),
                          //if height is not specified, then this value is used
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 403,
                width: 410,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(30.0),
                    bottomLeft: new Radius.circular(30.0),
                    bottomRight: new Radius.circular(30.0),
                    topRight: new Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // color: Colors.blue,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          width: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              _salons[widget.id - 1].file[0].imageLink,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 280,
                          child: Card(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Name:" +
                                            _salons[widget.id - 1].salonName,
                                        // softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(_salons[widget.id - 1]
                                      .serviceMappings[0]
                                      .category
                                      .toString()),
                                  Row(
                                    children: [
                                      Text("Rating :"),
                                      RatingBarIndicator(
                                        rating: _salons[widget.id - 1]
                                            .rating[0]
                                            .rating
                                            .toDouble(),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 35.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 300,
                          width: 405,
                          color: Colors.red,
                          child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: null == _salons
                                ? 0
                                : _salons[widget.id - 1].serviceMappings.length,
                            itemBuilder: (context, index) {
                              return ListView(
                                scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Divider(
                                    height: 2.5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      //decoration of saloon tile
                                      color: Colors.blueGrey[100],
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: ListTile(
                                      title: Text(_salons[widget.id - 1]
                                          .serviceMappings[index]
                                          .serviceName
                                          .name
                                          .toString()),
                                      subtitle: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Card(
                                              child: Row(
                                                children: <Widget>[
                                                  ButtonBar(
                                                    children: <Widget>[
                                                      Text("Duration :" +
                                                          _salons[widget.id - 1]
                                                              .serviceMappings[
                                                                  widget.id]
                                                              .serviceName
                                                              .duration
                                                              .toString()),
                                                      FlatButton(
                                                        child: Text("Add"),
                                                        onPressed: () {
                                                          setState(() {
                                                            total = total + 1;
                                                            _cart.add(_salons[
                                                                        widget.id -
                                                                            1]
                                                                    .serviceMappings[
                                                                index]);
                                                          });
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text("Remove"),
                                                        onPressed: () {
                                                          if (total > 0) {
                                                            setState(() {
                                                              total--;
                                                              _cart.remove(
                                                                  _salons[
                                                                      index]);
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue[100],
          ),
        ),
      );
    }
  }
}
