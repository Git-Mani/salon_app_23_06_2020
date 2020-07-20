import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloonapp23062020/api/Saloon.dart';
import 'package:saloonapp23062020/datte/date_picker_timeline.dart';

class TimeSlot extends StatefulWidget {
  List<Salon> _salon = [];

  TimeSlot(this._salon);

  @override
  _TimeSlotState createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  DateTime _selectedValue = DateTime.now();

  List<Color> _color3 = [];
  bool b = false;
  bool visible = false;
  int count = 0;

  Iterable<TimeOfDay> getTimes(
      TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;
    do {
      yield TimeOfDay(minute: minute, hour: hour);
      minute += step.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < 23 || (hour == 22 && minute <= 59));
  }

  Color isSelected(bool b, int i) {
    int c = 0;
    if (!b) {
      _color3[i] = Colors.green;
      return Colors.green;
    } else if (b) {
      _color3[i] = Colors.green;

      return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [];

//    int min=int.parse(widget._salon[1].openingTime.substring(3,4));
//    int hour2=int.parse(widget._salon[1].openingTime.substring(0,1));
    final startTime = TimeOfDay(hour: 9, minute: 00);
    final endTime = TimeOfDay(hour: 23, minute: 00);
    final step = Duration(minutes: 30);
    final timeSlot = getTimes(startTime, endTime, step)
        .map((tod) => tod.format(context))
        .toList();
    _colors = getColor(timeSlot.length);
    bool pressAttention = false;

    Color _color2 = Colors.white;
    return Container(
      height: 500,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              height: 130,
              padding: EdgeInsets.all(5.0),
              color: Colors.blueGrey[100],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Selected Date"),
                    Padding(
                      padding: EdgeInsets.all(0.5),
                    ),
                    // Text(_selectedValue.toString()),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    DatePickerTimeline(_selectedValue, onDateChange: (date) {
                      setState(() {
                        _selectedValue = date;
                      });
                    })
                  ])),
          Container(
            height: 200,
            child: GridView.count(
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: List.generate(timeSlot.length, (i) {
                return GestureDetector(
                  onTap: () {},
                  child: RaisedButton(
                      color: _color3[i],
                      onPressed: () {
                        visible = true;

                        setState(() {
                          if (b == false && _color3[i] != Colors.green) {
                            isSelected(b, i);
                            b = true;
                            print("s" + count.toString());
                            if (count != i && _color3[count] != Colors.orange) {
                              _color3[count] = Colors.orange;
                            }
                            count = i;
                          } else if (b == true && _color3[i] == Colors.orange) {
                            if (count != i) {
                              _color3[count] = Colors.orange;
                            }
                            print("sss");
                            isSelected(b, i);
                            count = i;
                            b = false;
                          } else {
                            if (_color3[i] == Colors.green) {
                              _color3[i] = Colors.orange;
                            }
                          }
                        });
                      },
                      child: Text(timeSlot[i].toString())),
                );
              }),
            ),
          ),
          Visibility(
              visible: visible,
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text("Book Now"))),
        ],
      ),
    );
  }

  List<Color> getColor(int i) {
    List<Color> color = [];
    int a = 0;
    while (a < i) {
      _color3.add(Colors.orange);
      a++;
    }

    return color;
  }
}
