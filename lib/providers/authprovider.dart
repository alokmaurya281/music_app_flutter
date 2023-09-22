import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String? _accessToken;

  String get accessToken => _accessToken ?? '';

  Future<void> getAccessToken() async {
    var clientId =
        'b994eb1d657b4910bb4fc52c93ba96e4'; // Set this to your Spotify client ID
    var clientSecret =
        '0d4d4ae3fdf04940ae38750c285c56f7'; // Set this to your Spotify client secret
    var response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );

    if (response.statusCode == 200) {
      _accessToken = json.decode(response.body)['access_token'];
      notifyListeners(); // Notify listeners that the access token has changed
    } else {
      throw Exception('Failed to get access token');
    }
  }
}
