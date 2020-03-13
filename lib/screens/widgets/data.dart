import 'package:flutter/material.dart';

class Job{
  final String name;
  final String description;
  final String image;
  final String salary;
  final String location;
  final String requirements;
  final String date;
  final String employer;
  final String activity;

  const Job({this.name, this.description, this.image, this.salary, this.location, this.requirements, this.date, this.employer, this.activity });
}

List<Job> retailJobs = [
  const Job(
    name: "Brick Layer",
    description: "Plaster and Lay down bricks",
    image: 'assets/images/BrickLayer.jpg',
    salary: '\$15/hr',
    location: 'Markham',
    requirements: 'Work 9 am to 5 pm|Be familiar with construction and regulations|Speak english adequately|blah blah',
    date: '3/15 - 3/18',
    employer: 'ABC Construction',
    activity: 'Intense'
  ),
  const Job(
    name: "Janitor",
    description: "Clean banquet hall after party",
    image: 'assets/images/Janitor.jpg',
    salary: '\$18/hr',
    location: 'Missisauga',
    requirements: 'Work 10 am to 7pm|Be available on call during shift to clean up messes|Be familiar with cleaning protocols',
    date: '3/16 - 3/20',
    employer: 'Cleaners Union',
    activity: 'Moderate'
  )
];

List<Job> constructionJobs = [
  const Job(
    name: "Brick Layer",
    description: "Plaster and Lay down bricks",
    image: 'assets/images/BrickLayer.jpg',
    salary: '\$15/hr',
    location: 'Markham',
    requirements: 'Work 9 am to 5 pm|Be familiar with construction and regulations|Speak english adequately|blah blah',
    date: '3/15 - 3/18',
    employer: 'ABC Construction',
    activity: 'Moderate'
  ),
  const Job(
    name: "Cash",
    description: "Clean banquet hall after party",
    image: 'assets/images/Janitor.jpg',
    salary: '\$18/hr',
    location: 'Missisauga',
    requirements: 'Work 10 am to 7pm|Be available on call during shift to clean up messes|Be familiar with cleaning protocols',
    date: '3/16 - 3/20',
    employer: 'Dollorama',
    activity: 'Low'
  )
];

List<Job> janitorialJobs = [
  const Job(
    name: "ur mom fat",
    description: "Plaster and Lay down bricks",
    image: 'assets/images/BrickLayer.jpg',
    salary: '\$15/hr',
    location: 'Markham',
    requirements: 'Work 9 am to 5 pm|Be familiar with construction and regulations|Speak english adequately|blah blah',
    date: '3/15 - 3/18',
    employer: 'Cleaners United',
    activity: 'Moderate'
  ),
  const Job(
    name: "Janitor",
    description: "Clean banquet hall after party",
    image: 'assets/images/Janitor.jpg',
    salary: '\$18/hr',
    location: 'Missisauga',
    requirements: 'Work 10 am to 7pm|Be available on call during shift to clean up messes|Be familiar with cleaning protocols',
    date: '3/16 - 3/20',
    employer: 'Markham Banquet',
    activity: 'Moderate'
  )
];