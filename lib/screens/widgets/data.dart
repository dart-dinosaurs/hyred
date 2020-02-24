import 'package:flutter/material.dart';

class Job{
  final String name;
  final String description;

  const Job({this.name, this.description});
}

List<Job> jobs = [
  const Job(
    name: "hello",
    description: "hi"
  ),
  const Job(
    name: "yes this actually fucking works",
    description: "Richard get off my ass XD :) :)"
  )
];