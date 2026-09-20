import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../models/moment.dart';

class MomentoDetalleScreen extends StatefulWidget {
  final Moment moment;
  final VoidCallback? onOpeningPause;
  final VoidCallback? onOpeningResume;

  const MomentoDetalleScreen({
    super.key,
    required this.moment,
    this.onOpeningPause,
    this.onOpeningResume,
  });

  @override
  State<MomentoDetalleScreen> createState() => _MomentoDetalleScreenState();
}

class _MomentoDetalleScreenState extends State<MomentoDetalleScreen> {
  // YouTube
  YoutubePlayerController? _ytController;

  // MP4 directo
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  bool _videoError = false;
  bool _isYoutube = false;

  @override
  void initState() {
    super.initState();
    widget.onOpeningPause?.call();
    _initVideo();
  }

  String? _extractYoutubeId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;
    if (uri.host.contains('youtube.com')) return uri.queryParameters['v'];
    if (uri.host.contains('youtu.be')) return uri.pathSegments.firstOrNull;
    return null;
  }

  Future<void> _initVideo() async {
    final ytId = _extractYoutubeId(widget.moment.videoUrl);

    if (ytId != null) {
      _isYoutube = true;
      _ytController = YoutubePlayerController.fromVideoId(
        videoId: ytId,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showFullscreenButton: true,
          strictRelatedVideos: true,
          showControls: true,
        ),
      );
      if (mounted) setState(() {});
      return;
    }

    // MP4 directo
    try {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.moment.videoUrl),
      );
      await _videoController!.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: false,
        looping: false,
        aspectRatio: 16 / 9,
        placeholder: Container(color: Colors.black),
        materialProgressColors: ChewieProgressColors(
          playedColor: const Color(0xFFD4AF37),
          bufferedColor: Colors.grey,
        ),
      );
      if (mounted) setState(() {});
    } catch (_) {
      if (mounted) setState(() => _videoError = true);
    }
  }

  @override
  void dispose() {
    _ytController?.close();
    _chewieController?.dispose();
    _videoController?.dispose();
    widget.onOpeningResume?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.moment.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del momento
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Image.asset(
                widget.moment.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.image, size: 60, color: Colors.white30),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.moment.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.moment.season,
                    style: const TextStyle(color: Color(0xFFD4AF37)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.moment.description,
                    style: TextStyle(color: Colors.grey[300], height: 1.7, fontSize: 15),
                  ),
                  const SizedBox(height: 28),

                  Text(
                    'Video del momento',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildVideoPlayer(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    // YouTube
    if (_isYoutube) {
      if (_ytController == null) {
        return Container(
          height: 200,
          color: Colors.black,
          child: const Center(child: CircularProgressIndicator()),
        );
      }
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayer(controller: _ytController!),
      );
    }

    // Error
    if (_videoError) {
      return Container(
        height: 200,
        color: Colors.grey[900],
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 40),
              SizedBox(height: 8),
              Text('No se pudo cargar el video', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    }

    // Cargando MP4
    if (_chewieController == null) {
      return Container(
        height: 200,
        color: Colors.black,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    // MP4
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(controller: _chewieController!),
    );
  }
}
