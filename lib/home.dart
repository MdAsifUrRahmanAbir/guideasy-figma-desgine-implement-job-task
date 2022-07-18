import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideasy/widgets/custom_list.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:video_player/video_player.dart';

import 'my_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late TabController _tabController;
  int activeTabIndex = 0;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    });

    _controller = VideoPlayerController.asset("images/my_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 251,
              width: double.infinity,
              child: ImageSlideshow(
                width: double.infinity,
                height: 251,
                initialPage: 0,
                indicatorColor: const Color(0xff00BE15),
                indicatorBackgroundColor: Colors.grey,
                children: [

                  InkWell(
                    onTap: (){
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Center(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),

                  Image.asset(
                    'images/i1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/i2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/i3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
                onPageChanged: (value) {
                  print('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true,
              ),
            ),

            const SizedBox(height: 36,),

            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PREMIUM PLAN',textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(color: const Color(0xff00BE16), fontWeight: FontWeight.w500, fontSize: 14),),
                  const SizedBox(height: 6,),
                  Text('Sajek Tour',textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(color: const Color(0xff01120E), fontWeight: FontWeight.w500, fontSize: 24),),
                  const SizedBox(height: 4,),
                  Text('Khagrachori, Bangladesh',textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(color: const Color(0xff868E96), fontWeight: FontWeight.w400, fontSize: 18),),
                  const SizedBox(height: 24,),


                  DefaultTabController(
                    length: 5,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child:MediaQuery.removePadding(
                            removeLeft: true,
                            context: context,
                            child: TabBar(
                              // onTap: (index){
                              //   setState(() {
                              //     activeTabIndex = index;
                              //   });
                              // },
                              controller: _tabController,
                              physics: const ScrollPhysics(),
                              isScrollable: true,
                              unselectedLabelColor: const Color(0xff868E96),
                              indicator:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(8), // Creates border
                                  color: const Color(0xff01120E)
                              ),
                              //Change background color from here
                              tabs: [
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 84,
                                    decoration: BoxDecoration(
                                      color: activeTabIndex == 0
                                          ? Colors.transparent
                                          : const Color(0xffFFFFFF),
                                        borderRadius:  BorderRadius.circular(8)
                                    ),
                                    child: const Text("Trip Plan"),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    width: 84,
                                    decoration: BoxDecoration(
                                      color: activeTabIndex == 1
                                          ? Colors.transparent
                                          : const Color(0xffFFFFFF),
                                        borderRadius:  BorderRadius.circular(8)
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("Overview"),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    width: 84,
                                    decoration: BoxDecoration(
                                      color: activeTabIndex == 2
                                          ? Colors.transparent
                                          : const Color(0xffFFFFFF),
                                        borderRadius:  BorderRadius.circular(8)
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("Policy"),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    width: 84,
                                    decoration: BoxDecoration(
                                      color: activeTabIndex == 3
                                          ? Colors.transparent
                                          : const Color(0xffFFFFFF),
                                        borderRadius:  BorderRadius.circular(8)
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("Reviews"),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    width: 84,
                                    decoration: BoxDecoration(
                                      color: activeTabIndex == 4
                                          ? Colors.transparent
                                          : const Color(0xffFFFFFF),
                                      borderRadius:  BorderRadius.circular(8)
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("Exclusion"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),

                        SizedBox(
                          height: 450,
                          child:  TabBarView(
                            controller: _tabController,
                            children:  [
                              tripdetail(),
                              const Align(
                                alignment: Alignment.center,
                                child: Text("Overview"),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text("Policy"),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text("Reviews"),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text("Exclusion"),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0xff868E96),
            blurRadius: 0.0,
              spreadRadius: 0.1
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BDT 2400',textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(color: const Color(0xff01120E), fontWeight: FontWeight.w500, fontSize: 22),),
                Text('Per Person',textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(color: const Color(0xff868E96), fontWeight: FontWeight.w400, fontSize: 14),),
              ],
            ),

            Container(
              alignment: Alignment.center,
              height: 60,
              width: MediaQuery.of(context).size.width/2.1,
              decoration: BoxDecoration(
                color: const Color(0xff00BE16),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text('Book Now',textAlign: TextAlign.center,
                style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),),
            )

          ],
        ),
      ),
    );
  }

  _appBar(context){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text('Package Details', style: GoogleFonts.roboto(color:const Color(0xff01120E) ),),
      leading: const Icon(Icons.arrow_back, color: Color(0xff01120E),),
      actions: [
        InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyVideoPlayer()));
            },
            child: Image.asset('asset/search.png'))
      ],
    );
  }

  tripdetail(){
    return Padding(
      padding: const EdgeInsets.only(right: 24, top: 24),
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('First Night',textAlign: TextAlign.left,
              style: GoogleFonts.roboto(color: const Color(0xff01120E), fontWeight: FontWeight.w500, fontSize: 16),),
            leading: Image.asset('asset/night.png'),
            trailing: const Icon(Icons.arrow_drop_down),
            backgroundColor: const Color(0xffE6F8E8),
            collapsedBackgroundColor: Colors.white,
            children: [

              CustomList(
                  title: 'Start Tour',
                  subtitle: 'From your destination',
                  url: 'asset/nstarttour.png',
                  time: '09:00 PM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Dinner',
                  subtitle: 'Khichuri, Biryani, Teheri, Bengali Dishes',
                  url: 'asset/ndinner.png',
                  time: '10:00 PM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Bus Journey',
                  subtitle: 'Dhaka → Khagrachori',
                  url: 'asset/nbusjourney.png',
                  time: '10:30 PM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Break Time',
                  subtitle: 'Snacks & Coffee',
                  url: 'asset/nbreaktime.png',
                  time: '01:00 AM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Bus Arrival',
                  subtitle: 'Arrived at Khagrachori',
                  url: 'asset/nbusarrival.png',
                  time: '05:00 AM'
              ),

            ],
          ),
          const SizedBox(height: 26,),
          ExpansionTile(
            title: Text('First Day',textAlign: TextAlign.left,
              style: GoogleFonts.roboto(color: const Color(0xff01120E), fontWeight: FontWeight.w500, fontSize: 16),),
            leading: Image.asset('asset/day.png'),
            trailing: const Icon(Icons.arrow_drop_down),
            backgroundColor: const Color(0xffE6F8E8),
            collapsedBackgroundColor: Colors.white,
            children: [

              CustomList(
                  title: 'Breakfast',
                  subtitle: 'Desi Paratha, Dal, Dim, Bread, Banana',
                  url: 'asset/nbreaktime.png',
                  time: '07:00 AM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Adventure with Chander Gari',
                  subtitle: 'Khagrachori → Sajek',
                  url: 'asset/dcandergari.png',
                  time: '07:30 AM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Arrival at Destination',
                  subtitle: 'Sajek',
                  url: 'asset/nbusarrival.png',
                  time: '10:30 PM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Check In',
                  subtitle: 'Cottage & Resort',
                  url: 'asset/dcheckin.png',
                  time: '12:00 AM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Lunch',
                  subtitle: 'Rice, Meat, Potato Smash & Daal',
                  url: 'asset/dlaunch.png',
                  time: '01:00 PM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'It’s Time for Adventure',
                  subtitle: 'Hiking to Konglak Hill',
                  url: 'asset/dhill.png',
                  time: '02:30 PM'
              ),

              Container(height: 1,color: const Color(0xffF2F2F2),width: double.infinity,),

              CustomList(
                  title: 'Sightseeing',
                  subtitle: 'Around Sajek',
                  url: 'asset/durbin.png',
                  time: '04:30 PM'
              ),

              const SizedBox(height: 2,)

            ],
          ),
        ],
      ),
    );
  }
}
