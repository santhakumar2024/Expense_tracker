import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
   ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal, [Object? data] );
  final String label;
 final double spendingAmount;
 double spendingPctOfTotal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        child :FittedBox(
          fit: BoxFit.cover,
        child: Text('₹ ${spendingAmount.toStringAsFixed(3)}'),
        ),
        ),
        SizedBox(
          height: 4,
          
        ),
        Container(
          height: 60,
          width:10 ,
          child: Stack(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey,
                  width:1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                ),
                
              Flexible(
              fit: FlexFit.tight,
                //heightFactor: spendingPctOfTotal,
                child:Container(
                  decoration: BoxDecoration(
                    color:Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    ),
                ) ,
              )
            ],
          ),
        ),
        SizedBox(
height: 4,
        ),
        Text(label),
      ],
    );
  }
}