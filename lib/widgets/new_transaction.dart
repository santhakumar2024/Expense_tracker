import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Newtransaction extends StatefulWidget {
 final Function addtx;
 
 Newtransaction(this.addtx);
 
 @override
  _NewtransactionState createState()=> _NewtransactionState();
}
  class _NewtransactionState extends  State<Newtransaction>{
  String amountinput="";
  String? titleinput;
    DateTime? _selecteddate;
  
  void _submitData(){
   final title=titleinput;
   double amount=double.parse(amountinput); 
   
   if(title==null||amount<=0.0){
    return;
   }
   widget.addtx(title,
    amount);
    Navigator.of(context).pop();
  }

  void _presentdatepicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
       firstDate: DateTime(2023), 
       lastDate: DateTime.now()
       ).then((pickeddate){
        if(pickeddate==null){
          return;
          
        }
        setState(() {
          _selecteddate=pickeddate;
        });
         
       });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child:Container(
              padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onChanged: (value){
                    titleinput=value;
                    
                  },
                  onSubmitted:(_)=> _submitData,
                  ),
                 TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  onChanged: (value){amountinput=value;
                  
                  },
                  keyboardType: TextInputType.number,
                  onSubmitted: (_)=> _submitData,
                  ),
                   Container(
                    height: 70,
                   child:Row(children:<Widget> [
                    Expanded(child: 
                    Text(_selecteddate==null ? 'No Date Chosen':DateFormat.yMd().format(_selecteddate!)
                    ),
                    ),
                    ElevatedButton(
                      child: Text('Choose Date'),
                      style: TextButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.purple),
                    onPressed:_presentdatepicker)
                  ],
                  ),
                  ),
                
               TextButton(child: Text('Add Transaction',
               ),
               style: TextButton.styleFrom(foregroundColor: Colors.purple,
              //  backgroundColor: Colors.purple.shade100
               ),
              
                onPressed:_submitData,
               ),
              ],
            ),
            ),
          );
  }
  }
 


