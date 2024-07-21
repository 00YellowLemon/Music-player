import 'package:flutter/material.dart';
import 'package:myapp/pages/song_page.dart';
import 'package:provider/provider.dart';
import 'package:myapp/themes/playlist_provider.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/models/song.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

// Suggested code may be subject to a license. Learn more: ~LicenseLog:1715953818.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:419595092.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2848281517.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3225806561.
class _MyHomePageState extends State<MyHomePage> {
  late PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int index) {
    playlistProvider.currentSongIndex = index;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(title: Text("Playlist")),
        drawer: MyDrawer(),
        body: Consumer<PlaylistProvider>(builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final Song song = playlist[index];
                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.albumImagePath),
                  onTap: () => goToSong(index),
                );
              });
        }));
  }
}
