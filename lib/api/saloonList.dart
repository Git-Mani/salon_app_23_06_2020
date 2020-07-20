import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:saloonapp23062020/Screen/bannerWidgetArea.dart';
import 'package:saloonapp23062020/api/Saloon.dart';
import 'package:saloonapp23062020/api/apiService.dart';

class SaloonList extends StatefulWidget {
  SaloonList() : super();

  @override
  _SaloonListState createState() => _SaloonListState();
}

class _SaloonListState extends State<SaloonList> {
  List<Salon> _salons;
  List<Salon> filterSalon = [];
  bool _loading = false;
  bool isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    _loading = true;
    Services.getDetail().then((salons) {
      setState(() {
        _salons = salons;
        filterSalon = _salons;
        //SaloonElement saloon=_salons[index];
        //print(saloon.salonName);
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // PageController controller = PageController(viewportFraction: 0.8 ,initialPage: 2);
    if (!_loading) {
      return Stack(
        children: [
          Positioned(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 300, 0, 0), //postion
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green,
              ),

              //color: Colors.blueGrey,
              child: ListView.builder(
                //addRepaintBoundaries:false ,
                //cacheExtent: 100,
                //primary: false,
                //padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: _salons.length,
                itemBuilder: (BuildContext context, int index) {
                  Salon saloon = _salons[index];
                  String rating = "New";

                  //  int c=index;
//                  if(c <= saloon.rating.length){
//                    rating=saloon.rating[c].rating.toString();
//                  }
                  return ListView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Divider(
                        //gap bw two saloon
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          //decoration of saloon tile
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Text(
                                "Name:" + saloon.salonName,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                "Type :" + saloon.salonType.name,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Flexible(
                                //for overlapping text we have wrap in flexible becoz we are inside in row
                                child: Text(
                                  "open time: " + saloon.openingTime,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              saloon.file[0].imageLink,
                            ),
                          ),
                          trailing: Text("rating :" + rating),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/detailPage',
                              arguments: saloon,
                            );
                          },
                          isThreeLine: false,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          BannerWidgetArea(),
          Container(
            margin: EdgeInsets.fromLTRB(340, 270, 0, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    child: Icon(Icons.sort),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(340, 270, 0, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: FloatingActionButton(
                    child: Icon(Icons.sort),
                  ),
                ),
              ],
            ),
          ),
          Container(
//          /  color: Colors.white,
            margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
            child: Column(
              children: [
//                 Theme(
//                   data: Theme.of(context).copyWith(splashColor: Colors.transparent),
//                   child: TextField(
//                     autofocus: false,
//                      style:TextStyle(fontSize: 22.0, color: Colors.black) ,
//                      decoration: InputDecoration(
//                        filled: true,
//                        fillColor: Colors.white,
//                        contentPadding: EdgeInsets.all(15.0),
//                        hintText: 'Filter by name',
//                      ),
//                      onChanged: (string) {
//                        setState(() {
//                          //filterSalon = _salons.where((u) => (u.salonName.toLowerCase().contains(string.toLowerCase()))).toList();
//                        });
//
//                      },
//                    ),
//                 ),
              ],
            ),
          ),
        ],
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
