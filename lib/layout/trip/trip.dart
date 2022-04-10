import 'package:flutter/material.dart';
import 'package:tripexpense/shared/styles/colors.dart';

/*class Person_trip extends StatefulWidget {
  const Person_trip({Key? key}) : super(key: key);

  @override
  _Person_tripState createState() => _Person_tripState();
}

class _Person_tripState extends State<Person_trip> {
  List<Map> personlsit = [
    {'name': 'tom', 'deposit amount': '1223£'},
    {'name': 'abir', 'deposit amount': '1200£'},
    {'name': 'zahra', 'deposit amount': '500£'}
  ];
  List<String> list = ["abir", "ritej "];
  buildperson({required Map val}) {
    return ListTile(
      title: Text(val['name']),
      subtitle: Text(val['deposit amount']),
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: grislight(),
            ),
            child: Column(children: [
              Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Text("abir .db"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: gris(),
                  ),
                  height: 100,
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          buildperson(val: personlsit[index]),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 1,
                          width: 100,
                          color: pink(),
                        );
                      },
                      itemCount: personlsit.length),
                ),
              ),
            ]),
          ),
        ));
  }
}*/
