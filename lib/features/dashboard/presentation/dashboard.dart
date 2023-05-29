import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:ardilla_test/features/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../onboarding/widgets.dart/build_dot.dart';
import '../data/models/models.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;
  int investmentCardIndex = 0;
  int productLevelCardIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    context.read<DashboardBloc>().add(GetCurrentTimeEvent());
    super.initState();
  }

  var controller = PageController(viewportFraction: 0.47);
  // var controller1 = ScrollController(viewportFraction: 0.9);

  bool isSideBarOpen = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<ExploreDataModel> exploreDataList = [
    ExploreDataModel(
        title: 'My Family and I',
        subtitle: 'A Family that stay together stays forever'),
    ExploreDataModel(
        title: 'Invest With Hargon', subtitle: 'Loan as an investment'),
    ExploreDataModel(
        title: 'Business with Ardilla',
        subtitle: 'A Partnership where you Earn!'),
    ExploreDataModel(
        title: 'Tax Save', subtitle: 'Where you save while spendingr'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(0.0)),
          child: Drawer(
            width: 210.w,
            backgroundColor: AppColors.primaryColor,
            child: const DrawerWidget(),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 2.sp),
            child: SafeArea(
              child: AppBar(
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    setState(() {
                      // isSideBarOpen = true;
                      scaffoldKey.currentState!.openDrawer();
                    });
                  },
                  child: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/lady_profile.png'),
                    radius: 20,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                        print("Builder called with state: $state");
                        if (state is CurrentTimeLoadingState) {
                          return const Text("...");
                        } else if (state is CurrentTimeLoadedState) {
                          return Row(
                            children: [
                              Text(
                                state.currentTime,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                'assets/svg/sun.svg',
                                height: 20.h,
                              ),
                            ],
                          );
                        } else if (state is CurrentTimeLoadingFailedState) {
                          return Text(state.errorMessage);
                        }
                        return const SizedBox();
                      },
                    ),
                    SizedBox(width: 15.h),
                    Text('Cadet <Annie/>',
                        style: TextStyles.large.copyWith(
                            fontSize: 17.sp,
                            color: AppColors.primaryColorDeep)),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: SvgPicture.asset('assets/svg/notification.svg'),
                    onPressed: () {
                      // Handle notifications icon onPressed
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 220.h,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: cardDataList.length,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        // shrinkWrap: true,
                        // controller: controller,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return cardWidgetList[index];
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          cardDataList.length,
                          (index) => BuildDot(
                            currentIndex: currentIndex,
                            mainWidth: 50.w,
                            elseWidth: 50.w,
                            height: 2.h,
                            index: index,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Quick Links",
                        style: TextStyles.small.copyWith(
                            color: AppColors.primaryColorDeep,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 55.sp, right: 55, bottom: 30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   height: 50.h,
                    //   width: 50.w,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.r),
                    //       ),
                    //       color: AppColors.primaryColor),
                    // ),
                    QuickLinkContainer(
                      backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                      color: AppColors.primaryColor,
                      image: 'stars',
                      title: 'SAN',
                    ),
                    QuickLinkContainer(
                      backgroundColor:
                          AppColors.secondaryColor.withOpacity(0.3),
                      color: AppColors.secondaryColor,
                      image: 'save',
                      title: 'Save',
                    ),
                    QuickLinkContainer(
                      backgroundColor: AppColors.appGreen.withOpacity(0.3),
                      color: AppColors.appGreen,
                      image: 'book',
                      title: 'Learn',
                    ),
                    QuickLinkContainer(
                      backgroundColor: AppColors.appYellow.withOpacity(0.3),
                      color: AppColors.appYellow,
                      image: 'pay',
                      title: 'Payment',
                    ),
                  ],
                ),
              ),
              const InflowContainer(),
              SizedBox(
                height: 0.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.sp, right: 30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ///create the next na dback buttons
                    Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0xffFAF4FE),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 14.sp,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffFAF4FE),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const InvestmentCard(),
              SizedBox(
                height: 220.h,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: productLevelWidgetList.length,
                        onPageChanged: (int index) {
                          setState(() {
                            productLevelCardIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.sp),
                            child: productLevelWidgetList[index],
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          productLevelWidgetList.length,
                          (index) => BuildDot(
                            currentIndex: productLevelCardIndex,
                            // mainWidth: 50.w,
                            // elseWidth: 50.w,
                            height: 2.h,
                            index: index,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 0.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 0.sp),
                child: SizedBox(
                  // color: Colors.amberAccent,
                  height: 255.h,
                  width: 320,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          height: 220.h,
                          width: 270.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(17.r)),
                              image: const DecorationImage(
                                  image: AssetImage(
                                'assets/images/backRectangle 64.png',
                              ))),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          height: 240.h,
                          width: 270.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.sp, vertical: 40.sp),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/ceo_image.png',
                                  ),
                                  fit: BoxFit.contain),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CEO, Mrs Oyinye',
                                  style: TextStyles.small.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.appWhite),
                                ),
                                Text(
                                  'What is Ardila and it benefits?',
                                  style: TextStyles.small.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.appWhite),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.h), // Purple card display section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: SizedBox(
                  height: 235.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColorDeep),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        height: 195.h,
                        // margin: EdgeInsets.all(30.0.sp),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColorDeep,
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/purple_Background.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Expanded(
                          child: ListView.separated(
                            itemCount: exploreDataList.length,
                            // onPageChanged: (int index) {
                            //   setState(() {
                            //     currentIndex = index;
                            //   });
                            // },
                            // shrinkWrap: true,
                            // controller: controller,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 55.sp,
                                        bottom: 45.sp,
                                        left: 30.sp,
                                        right: 30.sp),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(exploreDataList[index].title,
                                            style: TextStyles.medium.copyWith(
                                                color: AppColors.appWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17.sp)),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(exploreDataList[index].subtitle,
                                            style: TextStyles.medium.copyWith(
                                                color: AppColors.appWhite,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp)),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        Container(
                                          height: 25.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.appWhite,
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(13.r),
                                            ),
                                            //color: color ?? AppColors.primaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Coming Soon',
                                              style: TextStyle(
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 55.sp),
                              child: Container(
                                height: 50.h,
                                width: 1.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
