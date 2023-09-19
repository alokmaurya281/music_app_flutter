import 'package:http/http.dart' as http;

// var endPoint = "https://storage.googleapis.com/uamp/catalog.json";
// var url = '${endPoint}api/users';
var url = "https://storage.googleapis.com/uamp/catalog.json";

Map<String, String> headers = {};

Future<void> fetchData() async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Successful response, handle data
    // List<dynamic> json = json.decode(response.body);
  } else {
    // If that response was not OK, throw an error
    throw Exception('Failed to load data');
  }
}
