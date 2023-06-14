import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

import '../../../services/spotifyConnect.dart';

class MusicRecommandation extends StatefulWidget {
  String? query;
  MusicRecommandation({required this.query, super.key});

  @override
  State<StatefulWidget> createState() => MusicRecommandationState();
}

class MusicRecommandationState extends State<MusicRecommandation> {
  List<dynamic>? tracks;

  // AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    getTracks();
  }

  Future<void> getTracks() async {
    List<String> queySuffix= ['', 'songs', 'songs indian', 'song', 'and relax'];
    Random random = Random();
    int index = random.nextInt(queySuffix.length);
    var data = await SpotifyConnect.searchTrack('cure ${widget.query} ${queySuffix[index]}');
    setState(() {
      tracks = data;
    });
  }

  void openInChrome(String url) async {
    print(url);
    String encodedUrl = Uri.encodeFull(url);
    try {
      await launch(encodedUrl);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Recommandation'),
      ),
      body: tracks == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: tracks!.length,
              itemBuilder: (context, index) {
                final track = tracks![index];
                // print(' track = """${track['preview_url']}""" ');
                return ListTile(
                  onTap: () {
                    openInChrome(track['preview_url']);
                  },
                  leading: const Icon(Icons.music_note),
                  title: Text(track['name']),
                  subtitle: track['artist']==null ? const Text('no artist') : Text('${track['artist']}'),
                );
              },
            ),
    );
  }
}
