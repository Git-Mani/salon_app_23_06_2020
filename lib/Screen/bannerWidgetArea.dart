import 'package:flutter/material.dart';

class BannerWidgetArea extends StatelessWidget {
  var bannerItem = ["hair", "Shave", "Massage"];
  var bannerImage = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSQ9BwKOwoob-vvRdW1suX7aKSL7J-GFhZAUw&usqp=CAU",
    "https://cdn.mos.cms.futurecdn.net/VvP4jgiP8Lro7rcWmmxwaa-320-80.jpg",
    "https://www.phillymag.com/wp-content/uploads/sites/3/2020/02/Haven-Wellness-Center-featured.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 2);
    List<Widget> banners = new List<Widget>();
    for (int x = 0; x < bannerItem.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(8.0), //gap bw image
        child: Container(
          //  padding: EdgeInsets.all(10),
          child: Stack(
            fit: StackFit.loose, //banner image fit
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        //behind the image that's why we create this before clipreact
                        color: Colors.black12,
                        offset: Offset(1.0, 1.0),
                        spreadRadius: 0.0,
                        blurRadius: 1.0),
                  ],
                ),
              ),
              ClipRRect(
                //for curving the image
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Image(
                  image: NetworkImage(
                    bannerImage[x],
                    //  fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black12]),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  //offer text setting
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        bannerItem[x],
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    Text(
                      "more than 40% off",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
      color: Colors.blueGrey,
      height: screenHeight - 400,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10), //two widget gap
        child: Center(
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: banners,
          ),
        ),
      ),
    );
  }
}
