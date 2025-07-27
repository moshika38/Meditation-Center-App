import 'package:flutter/material.dart';
import 'package:meditation_center/components/app.loading.dart';
import 'package:meditation_center/components/playlist.bottom.card.dart';
import 'package:video_player/video_player.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final List<String> videoPaths = List.generate(
      10, (index) => 'assets/video/example_video.mp4');

  VideoPlayerController? _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideo(_currentIndex);
  }

  Future<void> _initializeVideo(int index) async {
    // Old controller dispose
    await _controller?.dispose();

    // New controller create
    final controller = VideoPlayerController.asset(videoPaths[index]);
    _controller = controller;

    await controller.initialize();
    controller.setLooping(true);
    controller.play();

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videoPaths.length,
      onPageChanged: (index) {
        _currentIndex = index;
        _initializeVideo(index);
      },
      itemBuilder: (context, index) {
        if (_controller == null || !_controller!.value.isInitialized) {
          return const Center(child: AppLoading());
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              _controller!.value.isPlaying
                  ? _controller!.pause()
                  : _controller!.play();
            });
          },
          child: Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller!.value.size.width,
                    height: _controller!.value.size.height,
                    child: VideoPlayer(_controller!),
                  ),
                ),
              ),
              const PlaylistBottomCard(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
