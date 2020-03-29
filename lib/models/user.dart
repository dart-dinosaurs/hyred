class User {

  final String uid;
  bool registered;
  String fname;
  String lname;

  User({ this.uid });

  void setRegistration(bool registered){
    this.registered = registered;
  }

  void setName(String fname, String lname){
    this.fname = fname;
    this.lname = lname;
  }
}