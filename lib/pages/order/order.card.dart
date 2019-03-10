import 'package:flutter/material.dart';
import 'package:foodtrucks/const.dart';
import 'package:foodtrucks/models/order.dart';

class OrderCard extends StatelessWidget {
  // final Widget child;
  final Order order;

  OrderCard(this.order);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(9),
        elevation: 3,
        child: Container(
            width: 300,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                 children: <Widget>[
                   Text('     OrderId : 12121',style: TextStyle(fontWeight: FontWeight.bold),)
                 ],
                ),
                SizedBox(height: 5,),
                Row(
                 children: <Widget>[
                   Text('     Address : Ravinia Drive 1',style: TextStyle(fontWeight: FontWeight.bold))
                 ],
                ),
                SizedBox(height: 25,),
                StatusMessageRow(),
                SizedBox(
                  height: 12,
                ),
                StatusRow()
              ],
            )),
      ),
    );
  }
}

class StatusMessageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Center(
            child: Text(
              'Submitted',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: Text(
              'Ready For Pickup',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: Text(
              'Delivered',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}

class StatusRow extends StatelessWidget {
  final Widget child;

  StatusRow({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(flex: 1, child: StatusCircle(true)),
        Flexible(flex: 1, child: StatusLine(true)),
        Flexible(
          flex: 1,
          child: StatusCircle(true),
        ),
        Flexible(flex: 1, child: StatusLine(false)),
        Flexible(flex: 1, child: StatusCircle(false))
      ],
    );
  }
}

class StatusCircle extends StatelessWidget {
  final bool isCompleted;
  StatusCircle(this.isCompleted);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? Constants.circleColor : Colors.grey,
      ),
      //  color: isCompleted ?  Colors.grey :Constants.circleColor,
      child: isCompleted
          ? Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            )
          : Text(''),
    );
  }
}

class StatusLine extends StatelessWidget {
  final bool isCompleted;

  StatusLine(this.isCompleted);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: isCompleted ? Constants.circleColor : Colors.grey,
    );
  }
}
