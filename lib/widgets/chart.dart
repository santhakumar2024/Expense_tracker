

import 'package:expense_tracker/widgets/chart_bar.dart';
import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';



class Chart extends StatelessWidget {
   const Chart(this.recent); 

  final List<Transaction> recent;

List <Map<String,Object>> get groupedTransactionValues{
  return List.generate(7, (index){
    final weekday=DateTime.now().subtract(Duration(days:index));
    var sum=0.0;
    for (var i = 0; i < recent.length; i++) {
      if(recent[i].date.day==weekday.day && 
      recent[i].date.month==weekday.month && 
      recent[i].date.year==weekday.year){
        sum+=recent[i].amount;
      }
      
    }
    return{
      'day':DateFormat.E().format(weekday) ,
      'amt':sum,
    };
  }).reversed.toList();
}

double get maxSpending{
  return groupedTransactionValues.fold(0.0,(total,item){//fold is used to sumup all the 
    return total+(item['amt']as double);
  });
}

  @override
  Widget build(BuildContext context) {
    return Card(
       elevation: 6,
       margin: EdgeInsets.all(20),
       child:Padding(
         padding: EdgeInsets.all(10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: 
       groupedTransactionValues.map((data){
         return 
         Flexible(
           fit: FlexFit.tight,
        child: ChartBar(
         data['day']as String,
          data['amt'] as double ,
          (data['amt']as double )/ maxSpending,
         
         ),
         );
       },
       ).toList(),
       ),
       ),
     );
  }
}