import 'package:flutter/material.dart';

class Category{
  final String heading;
  final String image;

  const Category({this.heading, this.image});
}

List<Category> industries = [
  const Category(
    heading: "Caregiving",
    image: "caregiving"
  ),
  const Category(
    heading: "Janitorial",
    image: "cleaning"
  ),
  const Category(
    heading: "Retail",
    image: "retail"
  ),
  const Category(
    heading: "Labour",
    image: "labour"
  ),
  const Category(
    heading: "Construction",
    image: "construction"
  ),
  const Category(
    heading: "Handyman",
    image: "handyman"
  ),
  const Category(
    heading: "Freelance",
    image: "freelance"
  ),

];