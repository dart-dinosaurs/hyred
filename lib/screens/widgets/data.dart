import 'package:flutter/material.dart';

class Category{
  final String heading;
  final String image;

  const Category({this.heading, this.image});
}

List<Category> industries = [
  const Category(
    heading: "Caregiving",
    image: "care"
  ),
  const Category(
    heading: "Janitorial",
    image: "janitor"
  ),
  const Category(
    heading: "Retail",
    image: "retail"
  ),
  const Category(
    heading: "Labour",
    image: "manual work"
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