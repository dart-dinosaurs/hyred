import 'package:flutter/material.dart';

class Job{
  final String name;
  final String description;
  final String image;
  final String salary;
  final String location;
  final List requirements;

  const Job({this.name, this.description, this.image, this.salary, this.location, this.requirements });
}

List<Job> jobs = [
  const Job(
    name: "Brick Layer",
    description: "Plaster and Lay down bricks",
    image: 'assets/images/BrickLayer.jpg',
    salary: '\$15/hr',
    location: 'Markham',
    requirements: [
      'Hello',
      'Hi'
    ]
  ),
  const Job(
    name: "Janitor",
    description: "Clean banquet hall after party",
    image: 'assets/images/Janitor.jpg',
    salary: '\$18/hr',
    location: 'Missisauga',
    requirements: [
      'Hello',
      'Hi'
    ]
  )
];