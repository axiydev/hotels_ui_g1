import 'package:flutter/material.dart';
import 'package:qr_scanner_app/consts/consts.dart';
import 'package:qr_scanner_app/consts/text_styles.dart';
import 'package:qr_scanner_app/models/hotels_model.dart';
import 'package:qr_scanner_app/pages/task/widget/custom_gradient_widget.dart';

/*
Created by Axmadjon Isaqov on 14:45:36 29.07.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::Hotels UI
*/

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  ScrollController? _controller;
  TextEditingController? _textEditingController;
  Size? _size;
  bool? _isVisible = false;
  late final List<Hotel?> _hotelList = [];
  @override
  void initState() {
    _controller = ScrollController();
    _textEditingController = TextEditingController();
    _controller!.addListener(() {
      if (_controller!.position.pixels > 153) {
        _isVisible = true;
        setState(() {});
      } else {
        _isVisible = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    _hotelList.addAll([
      Hotel(name: "Hotel 1", image: AppImages.hotelOne),
      Hotel(name: "Hotel 1", image: AppImages.hotelTwo),
      Hotel(name: "Hotel 1", image: AppImages.hotelThree),
      Hotel(name: "Hotel 1", image: AppImages.hotelFour),
      Hotel(name: "Hotel 1", image: AppImages.hotelFive),
    ]);
    super.didChangeDependencies();
  }

  // _showSearch() {
  //   showSearch(context: context, delegate: CustomSearchDelegate());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            expandedHeight: _size!.height * 0.25,
            floating: false,
            snap: false,
            primary: true,
            pinned: true,
            stretch: true,
            title: _isVisible!
                ? customTextField(controllerText: _textEditingController)
                : null,
            flexibleSpace: FlexibleSpaceBar(
                // title: const Text("flexible"),
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                  // StretchMode.fadeTitle
                ],
                background: CustomGradientWidget(
                  image: AppImages.hotelsHeader,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: _size!.height * 0.07,
                      ),
                      Text(
                        "What kind of hotel you need?",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.medium.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 1.1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      customTextField(controllerText: _textEditingController)!,
                    ],
                  ),
                )),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),

          ///text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Best  Hotels",
                style: AppTextStyles.regular.copyWith(
                    color: const Color(0xFF424242),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          ///sliver list
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: _hotelList.length,
                  itemBuilder: (context, index) =>
                      _hotelWidget(hotel: _hotelList[index])),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),

          ///text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Luxury  Hotels",
                style: AppTextStyles.regular.copyWith(
                    color: const Color(0xFF424242),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          ///sliver list
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: _hotelList.length,
                  itemBuilder: (context, index) =>
                      _hotelWidget(hotel: _hotelList[index])),
            ),
          ),

          ///text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Luxury  Hotels",
                style: AppTextStyles.regular.copyWith(
                    color: const Color(0xFF424242),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          ///sliver list
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: _hotelList.length,
                  itemBuilder: (context, index) =>
                      _hotelWidget(hotel: _hotelList[index])),
            ),
          ),
        ],
      ),
    );
  }

  Widget? customTextField({TextEditingController? controllerText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextField(
            controller: controllerText,
            decoration: InputDecoration(
                isDense: false,
                contentPadding: const EdgeInsets.only(bottom: 5, top: 10),
                hintText: 'Search for hotels',
                hintStyle: AppTextStyles.medium
                    .copyWith(fontSize: 17)
                    .copyWith(color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none)),
      ),
    );
  }

  ///hotel widget
  Widget _hotelWidget({Hotel? hotel}) {
    return Card(
      margin: const EdgeInsets.only(right: 15),
      color: Colors.transparent,
      elevation: .0,
      child: AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: AssetImage(hotel!.image!), fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.1),
                  ]),
            ),
            alignment: Alignment.bottomLeft,
            child: Text(
              hotel.name!,
              style: AppTextStyles.medium.copyWith(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
