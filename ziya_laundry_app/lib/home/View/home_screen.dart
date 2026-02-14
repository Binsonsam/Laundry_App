import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const primaryBlue = Color(0xFF002F96);
  static const bgColor = Color(0xFFEEF2F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER AND CONTENT WITH PADDING
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/logo-1.png'),
                          height: 30.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Juggle Laundry',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: primaryBlue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),

                    /// GREETING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello, Anna 👋',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            color: primaryBlue,
                          ),
                        ),
                        Icon(
                          Icons.notifications_none,
                          color: primaryBlue,
                          size: 24.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Need Laundry Service?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: primaryBlue,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    /// ADDRESS
                    Card(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: shadow,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18.sp,
                              color: primaryBlue,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                '1234 elm street, Aluva',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(0xFF666666),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF2FF),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: const Color(0xFF3B9FFF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// OFFER CARD
                    Card(
                      elevation: 4,
                      child: Container(
                        width: double.infinity,
                        height: 135.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFDBF1FB), Color(0xFF3A8EBD)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 3.h,
                              child: SizedBox(
                                width: 180.w,
                                height: 128.h,
                                child: Image.asset(
                                  'assets/carousal.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '15% OFF',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w900,
                                      color: HomePage.primaryBlue,
                                    ),
                                  ),
                                  Text(
                                    'First Order',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: HomePage.primaryBlue,
                                    ),
                                  ),
                                  Text(
                                    'Use Code : WASH15',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: HomePage.primaryBlue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: 27.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        color: HomePage.primaryBlue,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    /// SERVICES
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ServiceItem('Wash & Fold', 'assets/wash&fold.png'),
                          ServiceItem('Dry Cleaning', 'assets/Drycleaning.png'),
                          ServiceItem('Ironing', 'assets/Ironing.png'),
                          ServiceItem(
                            'Shoe Cleaning',
                            'assets/shoe Cleaning.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              /// SCHEDULED LAUNDRY
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFFFFF), Color(0xFFEEF2F7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scheduled Laundry',
                        style: TextStyle(
                          fontSize: 18.sp, // Slightly larger to match image 2
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF002283), // Darker navy blue
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: SchedulePickupCard(
                              topIcon: 'assets/pickup_icon.png',
                              clockIcon: 'assets/clock-icon 1.png',
                              title: 'Pickup Date',
                              time: 'Today, 4:00 PM',
                            ),
                          ),

                          SizedBox(width: 16.w),
                          Expanded(
                            child: SchedulePickupCard(
                              topIcon: 'assets/truck-delivery.png',
                              clockIcon: 'assets/clock-icon 1.png',
                              title: 'Delivery Date',
                              time: 'Tomorrow, 4:00 PM',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Container(
                          width: double
                              .infinity, // Matches the width style of the cards better
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF002283),
                            borderRadius: BorderRadius.circular(25.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Continue  ›',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // /// SCHEDULED LAUNDRY - FULL WIDTH GRADIENT
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     gradient: const LinearGradient(
              //       colors: [Color(0xFFFFFFFF), Color(0xFFEEF2F7)],
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 28.w,
              //       vertical: 20.h,
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Scheduled Laundry',
              //           style: TextStyle(
              //             fontSize: 16.sp,
              //             fontWeight: FontWeight.w800,
              //             color: HomePage.primaryBlue,
              //           ),
              //         ),

              //         SizedBox(height: 14.h),

              //         Row(
              //           children: [
              //             Expanded(
              //               child: _ScheduleMiniCard(
              //                 icon: 'assets/pickup_icon.png',
              //                 title: 'Pickup Date',
              //                 time: 'Today, 4:00 PM',
              //               ),
              //             ),
              //             SizedBox(width: 20.w), // ✅ exact gap
              //             Expanded(
              //               child: _ScheduleMiniCard(
              //                 icon: 'assets/truck-delivery.png',
              //                 title: 'Delivery Date',
              //                 time: 'Tomorrow, 4:00 PM',
              //               ),
              //             ),
              //           ],
              //         ),

              //         SizedBox(height: 18.h),

              //         Center(
              //           child: Container(
              //             width: 200.w, // ✅ exact
              //             height: 35.h, // ✅ exact
              //             decoration: BoxDecoration(
              //               color: HomePage.primaryBlue,
              //               borderRadius: BorderRadius.circular(20.r),
              //               border: Border.all(
              //                 color: const Color(0x80404040),
              //               ), // #40404080
              //             ),
              //             child: Center(
              //               child: Text(
              //                 'Continue  ›',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 14.sp,
              //                   fontWeight: FontWeight.w700,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),

              //         // Text(
              //         //   'Scheduled Laundry',
              //         //   style: TextStyle(
              //         //     fontSize: 16.sp,
              //         //     fontWeight: FontWeight.w800,
              //         //     color: primaryBlue,
              //         //   ),
              //         // ),
              //         // SizedBox(height: 14.h),
              //         // Row(
              //         //   children: const [
              //         //     Expanded(
              //         //       child: ScheduleCard(
              //         //         Icons.calendar_today_outlined,
              //         //         'Pickup Date',
              //         //         'Today, 4:00 PM',
              //         //       ),
              //         //     ),
              //         //     SizedBox(width: 12),
              //         //     Expanded(
              //         //       child: ScheduleCard(
              //         //         Icons.local_shipping_outlined,
              //         //         'Delivery Date',
              //         //         'Tomorrow, 4:00 PM',
              //         //       ),
              //         //     ),
              //         //   ],
              //         // ),
              //         // SizedBox(height: 22.h),
              //         // Center(
              //         //   child: Container(
              //         //     width: 240.w,
              //         //     height: 52.h,
              //         //     decoration: BoxDecoration(
              //         //       color: primaryBlue,
              //         //       borderRadius: BorderRadius.circular(30.r),
              //         //       boxShadow: shadow,
              //         //     ),
              //         //     child: Center(
              //         //       child: Text(
              //         //         'Continue  ›',
              //         //         style: TextStyle(
              //         //           color: Colors.white,
              //         //           fontSize: 16.sp,
              //         //           fontWeight: FontWeight.w700,
              //         //         ),
              //         //       ),
              //         //     ),
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ),
              // ),

              // /// SCHEDULED LAUNDRY - FULL WIDTH GRADIENT
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     gradient: const LinearGradient(
              //       colors: [Color(0xFFFFFFFF), Color(0xFFEEF2F7)],
              //       // begin: Alignment.topCenter,
              //       // end: Alignment.bottomCenter,
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 28.w,
              //       vertical: 20.h,
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Scheduled Laundry',
              //           style: TextStyle(
              //             fontSize: 16.sp,
              //             fontWeight: FontWeight.w800,
              //             color: primaryBlue,
              //           ),
              //         ),
              //         SizedBox(height: 14.h),
              //         Row(
              //           children: const [
              //             Expanded(
              //               child: ScheduleCard(
              //                 Icons.calendar_today_outlined,
              //                 'Pickup Date',
              //                 'Today, 4:00 PM',
              //               ),
              //             ),
              //             SizedBox(width: 12),
              //             Expanded(
              //               child: ScheduleCard(
              //                 Icons.local_shipping_outlined,
              //                 'Delivery Date',
              //                 'Tomorrow, 4:00 PM',
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 22.h),
              //         Center(
              //           child: Container(
              //             width: 240.w,
              //             height: 52.h,
              //             decoration: BoxDecoration(
              //               color: primaryBlue,
              //               borderRadius: BorderRadius.circular(30.r),
              //               boxShadow: shadow,
              //             ),
              //             child: Center(
              //               child: Text(
              //                 'Continue  ›',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 16.sp,
              //                   fontWeight: FontWeight.w700,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 12.h),

              /// REST OF CONTENT - WITH PADDING
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Your Order',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: primaryBlue,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TrackOrderCard(),
                    SizedBox(height: 22.h),
                    Text(
                      'Recently Ordered',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: primaryBlue,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    const OrderTile('Wash & Fold', '5 Items', 'Completed'),
                    SizedBox(height: 10.h),
                    const OrderTile('Blazers', '3 Items', 'In Progress'),
                    SizedBox(height: 22.h),
                    Row(
                      children: const [
                        Expanded(
                          child: BadgeBox(
                            Icons.timer_outlined,
                            '24–48 hrs\nDelivery',
                            Color(0xFFDFF5E4),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: BadgeBox(
                            Icons.auto_awesome_outlined,
                            'Premium\nQuality',
                            Color(0xFFD6E4FF),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: BadgeBox(
                            Icons.star_outline,
                            '4.8 Rating\nTrusted',
                            Color(0xFFEAD8FF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCE9FF),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: const Color(0xFF90B7FF)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hygiene Assured',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: primaryBlue,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.check, size: 16, color: primaryBlue),
                              SizedBox(width: 6),
                              Text('Premium detergents'),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.check, size: 16, color: primaryBlue),
                              SizedBox(width: 6),
                              Text('Sanitized packaging'),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.check, size: 16, color: primaryBlue),
                              SizedBox(width: 6),
                              Text('Quality checks'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const shadow = [
  BoxShadow(color: Color(0x22000000), blurRadius: 8, offset: Offset(0, 4)),
];

class ServiceItem extends StatelessWidget {
  final String title, icon;
  const ServiceItem(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 75.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: shadow,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  icon,
                  width: 50.w,
                  height: 40.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: HomePage.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final IconData icon;
  final String title, value;
  const ScheduleCard(this.icon, this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: HomePage.primaryBlue),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(fontSize: 11.sp, color: Colors.grey),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: HomePage.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class TrackOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
        color: const Color(0xFF9ED1F4),
        borderRadius: BorderRadius.circular(22.r),
      ),
      padding: EdgeInsets.all(14.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: HomePage.primaryBlue,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Order On Progress',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Pick up by Sajra is on the way',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: HomePage.primaryBlue,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      width: 52.64.w,
                      height: 46.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Image.asset(
                        'assets/done img.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Image.asset(
                      'assets/track img.png',
                      height: 40.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: Stack(
              children: [
                Image.asset(
                  'assets/map.png',
                  width: 155.w,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10.w,
                  bottom: 10.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: HomePage.primaryBlue,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Text(
                      'Track Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final String title, subtitle, status;
  const OrderTile(this.title, this.subtitle, this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: shadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: HomePage.primaryBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF98FB98),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Color(0xFF006400),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BadgeBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const BadgeBox(this.icon, this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: HomePage.primaryBlue),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: HomePage.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class SchedulePickupCard extends StatelessWidget {
  final String title;
  final String time;
  final String topIcon;
  final String clockIcon;

  const SchedulePickupCard({
    super.key,
    required this.title,
    required this.time,
    required this.topIcon,
    required this.clockIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145.w,
      height: 60.h, // exact visual height
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF00000040),
            // blurRadius: 8,
            // offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// ROW 1 — ICON + TITLE
          Row(
            children: [
              Image.asset(
                topIcon,
                width: 15.w,
                height: 15.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: HomePage.primaryBlue,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          /// ROW 2 — CLOCK + TIME
          Row(
            children: [
              Image.asset(
                clockIcon,
                width: 15.w,
                height: 15.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  time,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: HomePage.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
