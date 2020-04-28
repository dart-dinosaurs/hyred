import 'package:flutter/material.dart';

class Category{
  final String heading;
  final String image;

  const Category({this.heading, this.image});
}

List<Category> industries = [
  const Category(
    heading: "Caregiving",
    image: "0nkFvdcM-X4"
  ),
  const Category(
    heading: "Janitorial",
    image: "Iu6parQAO-U"
  ),
  const Category(
    heading: "Retail",
    image: "tE6th1h6Bfk"
  ),
  const Category(
    heading: "Labour",
    image: "t_rxW1yGpSU"
  ),
  const Category(
    heading: "Construction",
    image: "Za9oagRJNLM"
  ),
  const Category(
    heading: "Handyman",
    image: "WEWTGkPUVT0"
  ),
  const Category(
    heading: "Freelance",
    image: "hfk6xOjQlFk"
  ),

];