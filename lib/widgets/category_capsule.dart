import 'package:flutter/material.dart';

class CategoryCapsule extends StatelessWidget {
  const CategoryCapsule({super.key,required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return  Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Text(label,style: TextStyle(fontSize: 10),),
                              );
  }
}