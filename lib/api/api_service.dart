import 'package:http/http.dart' as http;

var endPoint = "https://reqres.in/";
  var url = '${endPoint}api/users';

  Map<String, String> headers = {};

Future<void> fetchData(url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Successful response, handle data
    
  } else {
    // If that response was not OK, throw an error
    throw Exception('Failed to load data');
  }
}
