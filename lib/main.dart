// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'widgets/chart.dart';

void main() {
  runApp( MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'expense tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: true,
      
      home: Home(
      ),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _usertranscation=[
   
      // Transaction(
      // id:'2',
      // title:'love',
      // amount:1000,
      // date:DateTime.now()
      // ),
  //     Transaction(id:'1',
  //     title:'file',
  //     amount:100,
  //     date:DateTime.now()
  //     ),
  //     Transaction(
  //     id:'2',
  //     title:'love',
  //     amount:1000,
  //     date:DateTime.now()
  //     ),
  //     Transaction(id:'1',
  //     title:'file',
  //     amount:100,
  //     date:DateTime.now()
  //     ),
  //     Transaction(
  //     id:'2',
  //     title:'love',
  //     amount:1000,
  //     date:DateTime.now()
  //     ),
  //     Transaction(id:'1',
  //     title:'file',
  //     amount:100,
  //     date:DateTime.now()
  //     ),
  //     Transaction(
  //     id:'2',
  //     title:'love',
  //     amount:1000,
  //     date:DateTime.now()
  //     ),
  //     Transaction(id:'1',
  //     title:'file',
  //     amount:100,
  //     date:DateTime.now()
  //     ),
  //     Transaction(
  //     id:'2',
  //     title:'love',
  //     amount:1000,
  //     date:DateTime.now()
  //     ),
  //     Transaction(
  //       id:'3',
  //     title:'file',
  //     amount:100,
  //     date:DateTime.now()
  //     ),
    //   Transaction(
    //   id:'2',
    //   title:'love',
    //   amount:1000,
    //   date:DateTime.now()
  ];
   List<Transaction> get _recent{
    return _usertranscation.where((tx) {//where is used in the list to check the list elements if the value is true then the value is stored in the newly returned list
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days:7),
        ),
        );
    }).toList();
   }
   void _addtransaction(String title,double amount)
   {
    final newtx=Transaction(
    title:title,
    amount:amount,
    date:DateTime.now(),
    id:DateTime.now().toString(),
    );
    setState(() {
      _usertranscation.add(newtx);
    });
   }
  @override//const Home({super.key});
  void _startnewtransaction(BuildContext ctx){
    showModalBottomSheet(
    context: ctx, 
    builder:(_) {
     
      return GestureDetector( 
       child: Newtransaction(_addtransaction),
       onTap: (){},
       behavior: HitTestBehavior.opaque,
      );
      
    }, );
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('EXPENSE TRACKER'),
        actions: [
          IconButton( 
            icon: const Icon(
              Icons.add,
              color:Colors.white ,
              ),
            onPressed:(){
              _startnewtransaction(context);
              },
              ),
        ],
      ),
        body:
        //Column(mainAxisAlignment: MainAxisAlignment.start,
          //height:MediaQuery.of(context).size.height,
        // SingleChildScrollView(child:
         //child:Column( 
          SingleChildScrollView(
            //controller: controller,
            child: Column(
              

          children:[ 
          
         Chart(_recent),
          Transactionlist(_usertranscation),
       ], ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {_startnewtransaction(context); },
        ),
        
    );
  }
}
