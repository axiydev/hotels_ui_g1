import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final GlobalKey _globalKey = GlobalKey(debugLabel: "QR");
  // QRViewController? _controller;

  @override
  void dispose() {
    // _controller!.dispose();
    super.dispose();
  }

  // onQrViewCreated(QRViewController? controller) {
  //   _controller = controller;
  //   if (!_controller!.hasPermissions) return;
  //   _controller!.scannedDataStream.listen((event) {
  //     print("DATAAAA::::${event.code}");
  //   });
  //   setState(() {});
  // }

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     _controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     _controller!.resumeCamera();
  //   }
  // }

  Size? _size;
  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Image
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/im_megapolis.jpg'))),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: _size!.width,
            height: double.infinity,
            alignment: Alignment.center,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  border: Border.all(color: Colors.grey, width: .1),
                  borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10, sigmaY: -10, tileMode: TileMode.clamp),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 20,
                                color: Color(0xFFacaebb),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Flexible(
                                child: Text(
                                  "small group",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFFacaebb)),
                                ),
                              )
                            ],
                          )),
                      const VerticalDivider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFacaebb),
                      ),
                      Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.star,
                                size: 20,
                                color: Color(0xFFacaebb),
                              ),
                              Flexible(
                                child: Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontSize: 17, color: Color(0xFFacaebb)),
                                ),
                              )
                            ],
                          )),
                      const VerticalDivider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFacaebb),
                      ),
                      Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.calendar,
                                size: 20,
                                color: Color(0xFFacaebb),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Flexible(
                                child: Text(
                                  "10 Days",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFacaebb)),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
