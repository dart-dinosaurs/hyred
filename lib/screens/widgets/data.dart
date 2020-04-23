import 'package:flutter/material.dart';

class Category{
  final String heading;
  final String image;

  const Category({this.heading, this.image});
}

List<Category> industries = [
  const Category(
    heading: "Retail",
    image: "https://source.unsplash.com/featured/?Retail"
  ),
  const Category(
    heading: "Construction",
    image: "https://dynamicmedia.zuza.com/zz/m/original_/5/1/51489095-e8ea-42b3-a042-425f3dd69ddc/B88649082Z.1_20190402135445_000_GVJHSGJ5.2-0_Super_Portrait.jpg"
  ),
  const Category(
    heading: "Service",
    image: "https://www.planitplus.net/JobProfileImages/264.jpg"
  ),
  const Category(
    heading: "Custodial",
    image: "https://s10721.pcdn.co/wp-content/uploads/2015/05/janitor-pic.jpg"
  )
];