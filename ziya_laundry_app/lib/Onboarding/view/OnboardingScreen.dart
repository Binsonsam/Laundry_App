
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:ziya_laundry_app/AuthSection/view/LoginScreen.dart';
import 'package:ziya_laundry_app/AuthSection/view/location.dart';
import 'package:ziya_laundry_app/AuthSection/view/signup_screen.dart';
import 'package:ziya_laundry_app/home/View/BottomNavigation/botton_navigation_page.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/Onboarding-3.mp4')
      ..initialize().then((_) {
        if (mounted) {
          _videoController.setLooping(true);
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _videoController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);

              if (!_videoController.value.isInitialized) return;
              index == 2
                  ? _videoController.play()
                  : _videoController.pause();
            },
            children: [
              _imagePage('assets/Onboarding-1.jpg'),
              _imagePage('assets/Onboarding-2.jpg'),
              _videoPage(),
            ],
          ),
          Positioned(
            top: 50.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Onboarding_icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Juggle Laundry',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _next,
                child: Container(
                  width: 150.w, 
                  height: 50.h,  
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.6),
                      width: 1.w,
                    ),
                  ),
                  child: Text(
                    _currentIndex == 2 ? 'Get Started' : 'Next',
                    style: TextStyle(
                      color: const Color(0xFF002F96),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagePage(String asset) {
    return SizedBox.expand(
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _videoPage() {
    if (!_videoController.value.isInitialized) {
      return const SizedBox();
    }
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _videoController.value.size.width,
          height: _videoController.value.size.height,
          child: VideoPlayer(_videoController),
        ),
      ),
    );
  }
}
