import 'package:flutter/material.dart';

class Job{
  final String name;
  final String description;
  final String image;
  final String salary;
  final String location;
  final String requirements;

  const Job({this.name, this.description, this.image, this.salary, this.location, this.requirements });
}

List<Job> jobs = [
  const Job(
    name: "Brick Layer",
    description: "Plaster and Lay down bricks",
    image: 'assets/images/BrickLayer.jpg',
    salary: '\$15/hr',
    location: 'Markham',
    requirements: 'Work 9 am to 5 pm|Be familiar with construction and regulations|Speak english adequately|blah blah'
  ),
  const Job(
    name: "Janitor",
    description: "Clean banquet hall after party",
    image: 'assets/images/Janitor.jpg',
    salary: '\$18/hr',
    location: 'Missisauga',
    requirements: 'Work 10 am to 7pm|Be available on call during shift to clean up spills or other messes|Be familiar with cleaning protocols'
  )
];