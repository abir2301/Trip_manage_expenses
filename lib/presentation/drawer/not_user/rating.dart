import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tripexpense/main.dart';
import 'package:tripexpense/shared/components/components.dart';
import 'package:tripexpense/shared/styles/colors.dart';

class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rate App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.stars,
                ))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rating : ${rating}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              RatingBar.builder(
                itemSize: 46,
                updateOnDrag: true,
                initialRating: rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                minRating: 1,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    this.rating = rating;
                  });

                  print("rating =${this.rating}");
                },
              ),
              TextButton(
                  onPressed: () => showRating(),
                  child: Text("show Dialog to rate App")),
            ],
          ),
        ));
  }

  void showRating() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Rate this app ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "please leave a star rating ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: gris(),
                  ),
                ),
                RatingBar.builder(
                  itemSize: 46,
                  updateOnDrag: true,
                  initialRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  minRating: 1,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      this.rating = rating;
                    });

                    print("rating =${this.rating}");
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          ));
}
