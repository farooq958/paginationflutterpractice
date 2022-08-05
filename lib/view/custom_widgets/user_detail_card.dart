import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/paginatedmodel/paginated_model.dart';

Widget userDetailCard(double width, User user, double height) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 200,
    width: width / 1.5,
    decoration: const BoxDecoration(
        boxShadow: [
          //color: Colors.white, //background color of box
          BoxShadow(
            color: Colors.blueAccent,
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
        color: Colors.grey),
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: Text(
            'Username  ${user.username}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: SizedBox(
                height: 120,
                width: width,
                child: Card(
                  color: Colors.lightGreen.withOpacity(0.5),
                  shadowColor: Colors.tealAccent,
                  elevation: 20,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Text(
                        'Email  ${user.email}',
                        style: TextStyle(
                            color: Colors.deepPurple.withOpacity(0.9)),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text('Address  ${user.address.city}',
                          style: TextStyle(
                              color: Colors.deepPurple.withOpacity(0.8))),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        'Id  ${user.id}',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text('State   ${user.address.state}',
                          style: TextStyle(
                              color: Colors.deepPurple.withOpacity(0.8))),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text('Postal Code  ${user.address.postalCode}',
                          style: TextStyle(
                              color: Colors.deepPurple.withOpacity(0.8))),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 90,
                width: 70,
                child: CircleAvatar(
                  //  minRadius: 40,
                  child: Image.network(
                    user.image,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
