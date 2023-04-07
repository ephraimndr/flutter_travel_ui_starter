import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/activity_model.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key, required this.destination});

  final Destination destination;

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: Image(
                  image: AssetImage(widget.destination.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.sortAmountDownAlt,
                        size: 20.0,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 15,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        widget.destination.country,
                        style: TextStyle(color: Colors.white70, fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Icon(
                Icons.location_on,
                size: 25,
                color: Colors.white70,
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              Activity activity = widget.destination.activities[index];
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 10, 20, 5),
                    height: 170.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(activity.name),
                            Text('\$${activity.price}'),
                          ],
                        ),
                        Text(activity.type),
                        // _buildRatingStars(activity.rating),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: widget.destination.activities.length,
          ),
        )
      ]),
    );
  }
}
