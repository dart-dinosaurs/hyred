import 'package:flutter/material.dart';

var months = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "June",
  7: "July",
  8: "Aug",
  9: "Sept",
  10: "Oct",
  11: "Nov",
  12: "Dec",
};

class TimePicker extends StatefulWidget {
  final Function onFinish;
  final String labelText;
  final Function disabled;

  TimePicker(
      {@required this.onFinish,
      @required this.labelText,
      @required this.disabled});


  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime _date;
  TimeOfDay _time;

  Future<Null> _selectDateTime(BuildContext context) async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).accentColor,
            accentColor: Theme.of(context).accentColor,
            buttonTheme: ButtonTheme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).accentColor,
              ),
            ),
          ),
          child: child,
        );
      },
    );
    if (time != null) {
      this.setState(() {
        _time = time;
      });
    }
    widget.onFinish(_time);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        color: Colors.white,
        onPressed: widget.disabled()
            ? null
            : () {
                _selectDateTime(context);
              },
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 18.0,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          _time == null
                              ? " Not set"
                              : " ${_time.format(context)}",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                widget.labelText,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
