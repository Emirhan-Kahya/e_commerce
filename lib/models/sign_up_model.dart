class SignUpBody {
  String name, phone, email, password;

  SignUpBody({
    required this.password,
    required this.email,
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.password;

    return data;
  }
}
