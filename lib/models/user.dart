class User {

  final String uid;
  bool registered;
  String fname;
  String lname;
  String street;
  String apartment;
  String city;
  String province;
  String postal;

  User({ this.uid, this.fname, this.lname, this.street, this.city, this.registered, this.apartment, this.postal, this.province});

  void setRegistration(bool registered){
    this.registered = registered;
  }

  void setName(String fname, String lname){
    this.fname = fname;
    this.lname = lname;
  }

  void setAddress(String street, String apartment, String city, String province, String postal){
    this.street = street;
    this.apartment = apartment;
    this.city = city;
    this.province = province;
    this.postal = postal;
  }
}