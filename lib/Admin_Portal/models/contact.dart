import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  Contact({
    required this.id,
    required this.Tname,
    required this.Sdate,
    required this.Edate,
    required this.Tdes,
    required this.Notes,
  });

  int id;
  String Tname;
  String Sdate;
  String Edate;
  String Tdes;
  String Notes;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        Tname: json["Tname"],
        Sdate: json["Sdate"],
        Edate: json["Edate"],
        Tdes: json["Tdes"],
        Notes: json["Notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Tname": Tname,
        "Sdate": Sdate,
        "Edate": Edate,
        "Task Description": Tdes,
        "Notes": Notes,
      };
}
