import 'dart:convert';
// import 'package:restful3/models/contact.dart';

import 'package:http/http.dart' as http;
import 'package:register/Admin_Portal/models/contact.dart';

class ContactService {
  static const url = 'http://localhost:3000/tasks';

  Future<List<Contact>> getAllContacts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // ignore: avoid_print

      final jsonData = json.decode(response.body) as List;
      final listOfContact =
          jsonData.map((data) => Contact.fromJson(data)).toList();

      return listOfContact;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load contact');
    }
  }

  Future<int> getContactViaId(int id) async {
    String restUrl = '$url/$id';

    final response = await http.get(Uri.parse(restUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return 200;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load contact');
    }
  }

  //return empty contact
  Future<Contact> deleteContact(String id) async {
    String restUrl = '$url/$id';

    final http.Response response = await http.delete(
      Uri.parse(restUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise `snapshot.hasData`
      // will always return false on `FutureBuilder`.
      // ignore: avoid_print
      return Contact(
          id: 0,
          Tname: "deleted",
          Sdate: "deleted",
          Edate: "deleted",
          Tdes: "deleted",
          Notes: "deleted");
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete contact.');
    }
  }

  Future<Contact> updateContact(
      int id, String Tname, int age, String Notes, String phone) async {
    final data = {'Tname': Tname, 'Notes': Notes, 'phone': phone};
    //final String jsonString = jsonEncode(data);

    final response = await http.put(
      Uri.parse('http://localhost:3000/tasks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // ignore: avoid_print
      print('hello');
      // ignore: avoid_print
      print(response.body);
      return Contact.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update contact.');
    }
  }
}
