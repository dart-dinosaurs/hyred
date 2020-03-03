import 'package:flutter/material.dart';

class Job{
  final String name;
  final String description;
  final String image;

  const Job({this.name, this.description, this.image });
}

List<Job> jobs = [
  const Job(
    name: "hello",
    description: "hi",
    image: '../../images/BrickLayer.jpg'
  ),
  const Job(
    name: "yes this actually fucking works",
    description: "Richard get off my ass XD :) :)",
    image: '../../images/BrickLayer.jpg'
  )
];