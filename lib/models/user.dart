class User {

  final String uid;
  bool registered;

  User({ this.uid });

  void setRegistration(bool registered){
    this.registered = registered;
  }
}