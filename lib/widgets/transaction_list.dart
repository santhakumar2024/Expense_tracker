import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class Transactionlist extends StatelessWidget {
  Transactionlist(this.transaction);

  final List<Transaction>transaction;

  @override
  Widget build(BuildContext context) {
    return Container( 
     
     height:700,
     
      //width: MediaQuery.of(context).size.width,
    child: transaction.isEmpty
    ?Column(children:[
      //Image.asset('assets/images/cash.jpg' ),
      Text('no spends today'),
      
    ]):
      ListView.builder(
      itemBuilder: (context, index) {
        return Card( 
        elevation:6 ,
        margin: EdgeInsets.symmetric(vertical:8,horizontal: 6),
                child: ListTile(
          leading: CircleAvatar(
            radius: 30,
           child: Padding(
              padding: EdgeInsets.symmetric(vertical:10,horizontal:8 ),
            child: FittedBox(
              child:Text('₹ ${transaction[index].amount}'),),
            ),
          ),
          title: Text(transaction[index].title,
          style: TextStyle(
             color: Theme.of(context).primaryColor ),
             ),
             subtitle: Text(
              DateFormat.yMMMd().format(transaction[index].date)
             ),
             
        ),
        );
        
        
        //  return Card(
                
        //         child:Row(
        //           children: [
        //           Container(
                    
        //             margin: EdgeInsets.symmetric(
        //               vertical: 10,
        //               horizontal: 15
        //               ),
        //               decoration: BoxDecoration(border: Border.all(
        //                 color: Theme.of(context).primaryColor,
        //                 width: 2,
                        
        //                 ),
                      
        //               ),
        //               padding: EdgeInsets.all(10),
        //             child: Text(
        //               "₹ ${transaction[index].amount.toStringAsFixed(2)}",//string interpolation wrapping a string in dart 'string ${value}' to escape the syntaxual meaning \ is required
        //             style: TextStyle(
        //               fontWeight:FontWeight.bold,
        //             fontSize: 20
        //             ,color: Theme.of(context).primaryColor
        //             ),
        //           ),
        //           ),
        //           Column( 
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //             Text(transaction[index].title,
        //             style: TextStyle(fontSize:20,
        //             fontWeight: FontWeight.bold),
                    
        //             ),
        //             Text(DateFormat.yMMMd ().format(transaction[index].date),
        //             style: TextStyle(color: Theme.of(context).primaryColor ,
        //             fontSize: 16,
        //             fontStyle:FontStyle.italic),),
        //           ],
        //           ),
        //         ],)
        //       );
      }, itemCount: transaction.length
    ),
    );
  }
}