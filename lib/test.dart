import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';


class VG extends StatefulWidget {
  final String subs;
  VG({@required this.subs});

  @override
  _VGState createState() => _VGState({subs:subs});
}

class _VGState extends State<VG> {
  final _database=FirebaseDatabase.instance.reference();
  String S=" ";
  int b=-1;
  final String subs;

  _VGState(Map<String, String> map,  {@required this.subs});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activateListeners();
  }
  void _activateListeners() async {
    print(subs);

    await _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/IT21007/').onValue.listen((event) {

      // final nextOrder=Map<String,dynamic>.from(event.snapshot.key);
      // print(nextOrder);
     // print("666666666666666666666");

      final String nextOrder=event.snapshot.value['Count'].toString();
      final int g=event.snapshot.value['Count']+1;
      print(nextOrder);


      print(g);


      setState(() {
        S=nextOrder;
        b=g;


        //print(nextOrder);
      });
   });





  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
          children: [

            Center(child: Text("jnhcbbbbbbfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"),),
            Center(child: Text(S),),
             //Center(child: Text(subs),),
            (S=='0' || S=='1')?Center(child: Text("valid"),):Center(child: Text("Invalid"),),
            ElevatedButton(onPressed: () async {
              await _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/IT21007/').update({'Count':b});
            }, child: Text("jb"))

          ],

        )
    );
  }
}
