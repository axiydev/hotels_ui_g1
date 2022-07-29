/*
Created by Axmadjon Isaqov on 19:06:04 27.07.2022
© 2022 @axi_dev 
*/
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_scanner_app/consts/consts.dart';
import 'package:qr_scanner_app/consts/text_styles.dart';
import 'package:qr_scanner_app/pages/lesson/widgets/error_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late AssetsAudioPlayer? _assetsAudioPlayer;
  bool? _isPlaying = true;
  Size? _size;
  late Duration? _maxTime;
  double? _currentValue = .0;
  double? _maxTimeValue;
  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    _assetsAudioPlayer = AssetsAudioPlayer();

    _openAudio();
    super.didChangeDependencies();
  }

  _openAudio() async {
    try {
      await _assetsAudioPlayer!.open(Audio(CustomAudio.sherali));
      _maxTime = _assetsAudioPlayer!.current.value!.audio.duration;
      _maxTimeValue = _maxTime!.inSeconds.toDouble();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _playAudio() async {
    try {
      await _assetsAudioPlayer!.setVolume(0.5);
      await _assetsAudioPlayer!.play();
      _isPlaying = true;
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _pauseAudio() async {
    try {
      await _assetsAudioPlayer!.pause();
      _isPlaying = false;
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(body: _body);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget? get _body {
    return Stack(
      fit: StackFit.expand,
      children: [
        //Image
        Container(
          width: _size!.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/im_megapolis.jpg',
                  ))),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10, sigmaY: -10, tileMode: TileMode.clamp),
            child: Container(
              color: const Color(0xFF121212).withOpacity(0.95),
            ),
          ),
        ),

        ///Blur Page
        SafeArea(
          child: Column(
            children: [
              ///AppBar
              const Card(
                  color: Colors.transparent,
                  elevation: .0,
                  margin: EdgeInsets.all(.0),
                  child: ListTile(
                    dense: true,
                    leading: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'ibai lanos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.ellipsis,
                      color: Colors.white,
                    ),
                  )),

              ///Image
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Image.asset(AppImages.sherali),
              ),
              const SizedBox(
                height: 28,
              ),

              ///Title sample
              Card(
                elevation: .0,
                margin: const EdgeInsets.all(.0),
                color: Colors.transparent,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  minVerticalPadding: 0,
                  dense: false,
                  title: Text(
                    'Sensan yorimn',
                    style: AppTextStyles.medium,
                  ),
                  subtitle: Text(
                    'Sherali jorayev',
                    style: AppTextStyles.regular.copyWith(
                        height: 3,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFB3B3B3)),
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.heart,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),

              StreamBuilder<Duration>(
                  stream: _assetsAudioPlayer!.currentPosition,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ErrorAudioWidget();
                    } else if (!snapshot.hasData) {
                      return const ErrorAudioWidget();
                    }
                    return IgnorePointer(
                      ignoring: false,
                      child: SliderTheme(
                        data: const SliderThemeData(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 9)),
                        child: Slider(
                            max: _maxTimeValue!,
                            min: 0,
                            value: snapshot.data!.inSeconds.toDouble(),
                            inactiveColor:
                                const Color.fromRGBO(255, 255, 255, 0.2),
                            activeColor: Colors.white,
                            onChanged: (value) async {
                              _currentValue =
                                  snapshot.data!.inSeconds.toDouble();
                              // await _assetsAudioPlayer!
                              //     .seek(Duration(seconds: value ~/ 1000));
                              if (value == _maxTimeValue) {
                                _isPlaying = false;
                                setState(() {});
                              }
                              setState(() {});
                            }),
                      ),
                    );
                  }),

              StreamBuilder<Duration>(
                  stream: _assetsAudioPlayer!.currentPosition,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ErrorAudioWidget();
                    } else if (!snapshot.hasData) {
                      return const ErrorAudioWidget();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _myText(
                                  "${snapshot.data!.inSeconds ~/ 60}:${snapshot.data!.inSeconds % 60}"),
                              _myText(
                                  "${(_maxTime!.inSeconds ~/ 60)}:${_maxTime!.inSeconds % 60}")
                            ],
                          )),
                    );
                  }),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.shuffle,
                          color: Colors.white,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.backwardStep,
                          color: Colors.white,
                        ),
                        FloatingActionButton(
                          heroTag: 'ok',
                          elevation: .0,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.transparent,
                          onPressed: () {
                            _isPlaying! ? _pauseAudio() : _playAudio();
                          },
                          child: FaIcon(
                              _isPlaying!
                                  ? FontAwesomeIcons.pause
                                  : FontAwesomeIcons.play,
                              color: Colors.black),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.forwardStep,
                          color: Colors.white,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.repeat,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: _size!.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.device),
                      const FaIcon(
                        FontAwesomeIcons.list,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Text _myText(String? text) {
    return Text(
      text!,
      style: AppTextStyles.regular.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFB3B3B3)),
    );
  }
}
