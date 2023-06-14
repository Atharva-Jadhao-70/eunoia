import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/trackModel.dart';

class SpotifyConnect {
  static Future<String> getAccessToken() async {
    final clientId = '0b9ff0c14905412f8275587deef939a5';
    final clientSecret = '0aacab035a3249b79d69c73b84005e45';
    final credentials = '$clientId:$clientSecret';
    final credentialsBase64 = base64.encode(utf8.encode(credentials));

    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization': 'Basic $credentialsBase64',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'grant_type=client_credentials',
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final accessToken = jsonResponse['access_token'];
      return accessToken;
    } else {
      throw Exception('Failed to obtain access token');
    }
  }

  static Future<dynamic> searchTrack(String query) async {
    final accessToken = await getAccessToken();

    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/search?q=$query&type=track'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final tracksJson = jsonResponse['tracks']['items'];
      print(tracksJson);
      // final tracks =
      //     List<Track>.from(tracksJson.map((json) => Track.fromJson(json)));
      return tracksJson;
      // print(jsonResponse);
    } else {
      throw Exception('Failed to search for track');
    }
  }
}
