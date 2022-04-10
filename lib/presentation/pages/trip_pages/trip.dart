import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tripexpense/db/trip_operation.dart';
import 'package:tripexpense/models/trip_model.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

class TripStack extends StatelessWidget {
  final Trip value;
  final int index;
  TripStack({required this.value, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {},
        child: Material(
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/trip1.jpg",
                    width: size.width,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        value.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value.date_start),
                          SizedBox(
                            width: 3,
                          ),
                          Text("to "),
                          Text(value.date_finish),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(value.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
