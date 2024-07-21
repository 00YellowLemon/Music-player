import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/themes/playlist_provider.dart';
import 'package:myapp/components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      final playlist = value.playlist;
      final currentSong = playlist[value.currentSongIndex!];

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text("P L A Y L I S T"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                    ],
                  ),
                  NavBox(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              currentSong.albumImagePath,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentSong.songName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(currentSong.artistName)
                                  ],
                                ),
                                const SizedBox(width: 25.0),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value.currentDuration.toString()),
                          Icon(Icons.shuffle),
                          Icon(Icons.repeat),
                          Text(value.totalDuration.toString()),
                        ],
                      ),
                    ),
                    Slider(
                      value: value.currentDuration.inSeconds.toDouble(),
                      min: 0,
                      max: value.totalDuration.inSeconds.toDouble(),
                      activeColor: Colors.green,
                      onChanged: (double double) {

                      },
                      onChangeEnd: (double double) {
                        value.seek(Duration(seconds: double.toInt()));
                      },
                    ),
                  ]),
                  const SizedBox(height: 16),
                  Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playPreviousSong,
                        child: NavBox(child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.skip_previous),
                        )),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: value.pauseOrResume,
                        child: NavBox(child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(value.isPlaying ?Icons.pause: Icons.play_arrow),
                        )),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playNextSong,
                        child: NavBox(child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.skip_next),
                        )),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}