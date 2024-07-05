import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../presentation/chat/view/chat_screen.dart';
import 'package:final_project/profile/profile_page.dart';
import 'package:final_project/presentation/trans/home_view_trans.dart';
import 'package:final_project/presentation/note/screens/note_view.dart';
import 'package:final_project/presentation/weater_feature/homepage.dart';
import 'package:final_project/presentation/store_feature/shop_layout.dart';
import 'package:final_project/presentation/navigation_bar/bottom_bar_item.dart';
import 'package:final_project/presentation/navigation_bar/bottom_bar_double_bullet.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final PageController controller = PageController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      bottomNavigationBar: BottomBarDoubleBullet(
        items: [
          BottomBarItem(
            iconData: Icons.home_outlined,
            // label: 'Home',
          ),
          BottomBarItem(
            iconData: Icons.chat_outlined,
            // label: 'Chat',
          ),
          BottomBarItem(
            iconData: Icons.shopping_cart_checkout_sharp,
            //  label: 'Notification',
          ),
          BottomBarItem(
            iconData: Icons.g_translate_sharp,
            //  label: 'Notification',
          ),
          BottomBarItem(
            iconData: Icons.brightness_high_sharp,
            // label: 'Calendar',
          ),
          BottomBarItem(
            iconData: Icons.note_add_outlined,
            // label: 'Calendar',
          ),
          BottomBarItem(
            iconData: Icons.settings_outlined,
            // label: 'Setting',
          ),
        ],
        onSelect: (index) {
          controller.jumpToPage(index);
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: <Widget>[
            Center(
              child: MainHomeView(),
            ),
            Center(
              child: ChatScreen(),
            ),
            Center(
              child: ShopLayout(),
            ),
            Center(
              child: TranslatorFeature(),
            ),
            Center(
              child: HomeViewWeatherFeature(),
            ),
            Center(
              child: NoteView(),
            ),
            Center(
              child: ProfilePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView>
    with TickerProviderStateMixin {
  late final TabController tabController;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10.0);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffEFEFEF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cover6.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: size.width,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Center(
                          child: TabBar(
                            overlayColor:
                                WidgetStateProperty.all(Colors.transparent),
                            labelPadding: EdgeInsets.only(
                              left: size.width * 0.02,
                              right: size.width * 0.04,
                            ),
                            controller: tabController,
                            labelColor: const Color(0xff04658e),
                            unselectedLabelColor: Colors.black,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: const CircleTabBarIndicator(
                              color: const Color(0xff04658e),
                              radius: 5,
                            ),
                            tabs: const [
                              Tab(
                                child: Text(
                                  "Beaches",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  " Monuments",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Cities",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.4,
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            TabViewChild(list: Beaches),
                            TabViewChild(list: Monuments),
                            TabViewChild(list: Cities),
                          ]),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child: Text(
                      'People Also Like',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff04658e),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1100),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.68,
                      child: ListView.builder(
                          itemCount: peopleAlsoLikeModel.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            PeopleAlsoLikeModel current =
                                peopleAlsoLikeModel[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    personData: current,
                                    tabData: null,
                                    isCameFromPersonSection: true,
                                  ),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                width: size.width,
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: current.day,
                                      child: Container(
                                        margin: const EdgeInsets.all(8.0),
                                        width: size.width * 0.28,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              current.image,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.035,
                                          ),
                                          AppText(
                                            text: current.title,
                                            size: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.005,
                                          ),
                                          AppText(
                                            text: current.location,
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabViewChild extends StatelessWidget {
  const TabViewChild({
    required this.list,
    Key? key,
  }) : super(key: key);

  final List<TabBarModel> list;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        TabBarModel current = list[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                personData: null,
                tabData: current,
                isCameFromPersonSection: false,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: current.image,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(current.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: size.height * 0.2,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.53,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(153, 0, 0, 0),
                        Color.fromARGB(118, 29, 29, 29),
                        Color.fromARGB(54, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.045,
                child: AppText(
                  text: current.title,
                  size: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.025,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: size.width * 0.01),
                    AppText(
                      text: current.location,
                      size: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
    required this.fontStyle,
    this.fontFamily = 'CustomFont',
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      ),
    );
  }
}
// thired painter.dart

class CircleTabBarIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabBarIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

class PeopleAlsoLikeModel {
  final String title;
  final String location;
  final int day;
  final String image;

  final String description;
  final double rating;
  final int reviewCount;
  PeopleAlsoLikeModel(
      {required this.title,
      required this.location,
      required this.day,
      required this.image,
      required this.description,
      required this.rating,
      required this.reviewCount});
}

List<PeopleAlsoLikeModel> peopleAlsoLikeModel = [
  PeopleAlsoLikeModel(
    title: "The Citadel of Qaitbay",
    location: "Alexandria",
    image: "assets/images/kitbay.jpg",
    day: 5,
    description:
        'The Citadel of Qaitbay, located in Alexandria, is a stunning fortress overlooking the Mediterranean Sea. Built in the 15th century by Sultan Al-Ashraf Sayf al-Din Qa\'it Bay, it stands as a testament to the city\'s rich history. Visitors can explore its historical walls, learn about its strategic importance in protecting against Crusader invasions, and enjoy breathtaking sea views. The citadel also houses a maritime museum that offers insights into Alexandria\'s naval history. It is a perfect spot for history enthusiasts and photographers alike.',
    rating: 4.5,
    reviewCount: 200,
  ),
  PeopleAlsoLikeModel(
    title: "Marsa Matrouh",
    location: "Egypt",
    image: "assets/images/images.jpeg",
    day: 7,
    description:
        'Marsa Matrouh is a beautiful coastal city known for its pristine white sand beaches and crystal-clear turquoise waters. It is a popular summer destination for both locals and tourists. Visitors can enjoy swimming, snorkeling, and relaxing by the sea, while also exploring nearby attractions such as Cleopatra\'s Bath, a natural rock pool said to have been used by the famous queen. Additionally, the Rommel Museum, located in a cave where German General Rommel planned his military operations during World War II, offers a unique historical experience. The city\'s vibrant markets and seafood restaurants add to its charm.',
    rating: 4.5,
    reviewCount: 200,
  ),
  PeopleAlsoLikeModel(
    title: "Siwa Oasis",
    location: "The Western Desert of Egypt",
    image: "assets/images/Sossusvlei.jpg",
    day: 9,
    description:
        'Siwa Oasis, nestled in the Western Desert of Egypt, is a serene and picturesque destination known for its natural beauty and rich cultural heritage. The oasis is home to lush palm groves, salt lakes, and ancient ruins. Visitors can explore the historic Shali Fortress, an ancient mud-brick citadel offering panoramic views of the oasis. Bathing in the Cleopatra Spring, a natural hot spring, is a must-do experience. The unique Berber culture and the locally made crafts add to the oasis\' charm, making it a perfect getaway for those seeking tranquility and cultural immersion.',
    rating: 4.5,
    reviewCount: 200,
  ),
  PeopleAlsoLikeModel(
    title: "Coptic Cairo (Old Cairo)",
    location: "Egypt",
    image: "assets/images/mo3lka.jpeg",
    day: 3,
    description:
        'Coptic Cairo, also known as Old Cairo, is a historic area that is home to many of Egypt\'s oldest churches and religious sites. Visitors can explore the Coptic Museum, which houses a vast collection of Coptic art and artifacts. The Hanging Church, or Saint Virgin Mary\'s Coptic Orthodox Church, is renowned for its beautiful architecture and religious significance. Nearby, the Ben Ezra Synagogue is one of the oldest in Cairo and is steeped in history. The area offers a glimpse into Egypt\'s rich Christian heritage and its vibrant Coptic community, making it a fascinating destination for history and culture enthusiasts.',
    rating: 4.5,
    reviewCount: 200,
  ),
];

class MiddleAppText extends StatelessWidget {
  MiddleAppText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: text,
            size: 19,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ],
      ),
    );
  }
}

class TabBarModel {
  final String title;
  final String location;
  final String image;

  final String description;
  final double? rating;
  final int reviewCount;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,
      required this.description,
      required this.rating,
      required this.reviewCount});
}

List<TabBarModel> Beaches = [
  TabBarModel(
    title: "Naama Bay",
    location: "Sharm El-Sheikh",
    image: "assets/images/Naama.jpg",
    description:
        "Naama Bay is a bustling center of activity in Sharm El-Sheikh, Egypt. Known for its beautiful beaches, crystal clear waters, and vibrant nightlife, it is a popular destination for tourists looking to enjoy both relaxation and excitement. Visitors can indulge in a variety of water sports, dine at numerous restaurants offering local and international cuisine, and explore the lively shops and markets. Naama Bay's picturesque setting and lively atmosphere make it a must-visit spot on the Red Sea coast.",
    rating: 4,
    reviewCount: 200,
  ),
  TabBarModel(
    title: "El Gouna",
    location: "Hurghada",
    image: "assets/images/gouna.jpg",
    description:
        "El Gouna is a modern resort town located near Hurghada on Egypt's Red Sea coast. It is known for its luxurious amenities, beautiful marinas, and a variety of water sports activities. El Gouna offers a unique combination of traditional Egyptian architecture and modern facilities, making it a perfect destination for a relaxing and upscale vacation experience. Visitors can also enjoy world-class golf courses, stunning lagoons, and vibrant nightlife.",
    rating: 4.75,
    reviewCount: 200,
  ),
  TabBarModel(
    title: "Dahab",
    location: "Hurghada",
    image: "assets/images/Dahab.jpg",
    description:
        "Dahab is a small town on the southeast coast of the Sinai Peninsula in Egypt. It is renowned for its relaxed atmosphere, excellent diving spots, and windsurfing opportunities. Dahab attracts adventure seekers and nature lovers who enjoy exploring its coral reefs, underwater canyons, and the stunning desert landscapes that surround it. The town also boasts a variety of beachfront cafes and restaurants, adding to its laid-back charm.",
    rating: 4.5,
    reviewCount: 200,
  )
];

List<TabBarModel> Monuments = [
  TabBarModel(
    title: "Luxor Temple",
    location: "Luxor in Egypt",
    image: "assets/images/luxur.jpg",
    description:
        "Luxor Temple is a large Ancient Egyptian temple complex located on the east bank of the Nile River in the city of Luxor. It was built approximately 1400 BCE during the New Kingdom. The temple is known for its stunning architecture, massive pylons, and intricate hieroglyphics. Visitors can explore the temple's courtyards, halls, and sanctuaries, which are illuminated beautifully at night. Luxor Temple is part of the ancient city of Thebes, a UNESCO World Heritage site.",
    rating: 4.25,
    reviewCount: 200,
  ),
  TabBarModel(
    title: "Egyptian Museum",
    location: "Cairo in Egypt",
    image: "assets/images/Egyptian Museum.png",
    description:
        "The Egyptian Museum in Cairo is home to an extensive collection of ancient Egyptian antiquities. Founded in 1902, the museum houses over 120,000 items, including the treasures of Tutankhamun, mummies, and sarcophagi. Visitors can marvel at the intricate jewelry, statues, and artifacts that tell the story of Egypt's rich history. The museum's grand architecture and historic significance make it a must-visit for history enthusiasts and tourists alike.",
    rating: 4.5,
    reviewCount: 200,
  ),
  TabBarModel(
    title: "Temple of Philae",
    location: "Deir el-Bahari in Egypt",
    image: "assets/images/Temple of Philae.jpg",
    description:
        "The Temple of Philae is an ancient temple complex dedicated to the goddess Isis, located on Agilkia Island near Aswan. Originally situated on Philae Island, it was relocated to its current location to save it from the rising waters of the Nile due to the Aswan High Dam. The temple complex features beautiful reliefs, grand pylons, and a tranquil setting. Visitors can take a boat ride to the island and explore the well-preserved structures, making it a memorable cultural experience.",
    rating: 4.75,
    reviewCount: 200,
  )
];

List<TabBarModel> Cities = [
  TabBarModel(
    title: "New Administrative Capital",
    location: "Egypt",
    image: "assets/images/607d0368488549e7b9179724b0db4940.jpg",
    description:
        "The New Administrative Capital of Egypt is a large-scale urban development project aimed at modernizing the country's infrastructure. Located 45 kilometers east of Cairo, the city is designed to alleviate congestion in Cairo and provide a new hub for government, business, and culture. The city features modern skyscrapers, expansive green spaces, and state-of-the-art facilities. It is expected to house over 6 million people and become a major center of innovation and growth.",
    rating: 4.75,
    reviewCount: 200,
  ),
  TabBarModel(
    title: "Cairo",
    location: "Egypt",
    image: "assets/images/cairo.jpg",
    description:
        "Cairo, the capital city of Egypt, is a bustling metropolis that blends ancient history with modern life. Home to the iconic Pyramids of Giza and the Sphinx, Cairo offers a wealth of historical and cultural attractions. Visitors can explore the bustling bazaars of Khan El Khalili, visit the historic Al-Azhar Mosque, and enjoy a cruise along the Nile River. Cairo's vibrant street life, rich culinary scene, and dynamic arts and entertainment make it a captivating destination.",
    rating: 4.5,
    reviewCount: 200,
  ),
  TabBarModel(
    title: "Alexandria",
    location: "Egypt",
    image: "assets/images/alexcity.jpg",
    description:
        "Alexandria, Egypt's second-largest city, is a Mediterranean port city known for its rich history and cultural heritage. Founded by Alexander the Great in 331 BCE, the city boasts ancient landmarks such as the Catacombs of Kom El Shoqafa and the Roman Amphitheatre. Alexandria's stunning coastal views, historic library, and vibrant arts scene make it a unique blend of ancient and modern attractions. Visitors can enjoy fresh seafood, stroll along the Corniche, and explore the city's numerous museums.",
    rating: 4.25,
    reviewCount: 200,
  )
];

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.tabData,
    required this.personData,
    required this.isCameFromPersonSection,
  });

  final TabBarModel? tabData;
  final PeopleAlsoLikeModel? personData;
  final bool isCameFromPersonSection;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selected = 0;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 20.0);
  dynamic current;

  onFirstLoaded() {
    if (widget.tabData == null) {
      return current = widget.personData;
    } else {
      return current = widget.tabData;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    onFirstLoaded();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Hero(
                tag: widget.isCameFromPersonSection
                    ? current.day
                    : current.image,
                child: Container(
                  width: size.width,
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(current?.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: padding,
                width: size.width,
                height: size.height * 0.65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: current.title,
                                  size: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.black54,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    AppText(
                                      text: current.location,
                                      size: MediaQuery.of(context).size.width *
                                          5 /
                                          100,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 300),
                      child: Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              double rating = current.rating;
                              if (index + 1 <= rating) {
                                return FullStar();
                              } else if (index + 0.75 <= rating) {
                                return ThreeQuarterStar();
                              } else if (index + 0.5 <= rating) {
                                return HalfStar();
                              } else if (index + 0.25 <= rating) {
                                return QuarterStar();
                              } else {
                                return Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                );
                              }
                            }),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          AppText(
                            text: "(${current.rating})",
                            size: MediaQuery.of(context).size.width * 4 / 100,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      child: AppText(
                        text: "Description",
                        size: MediaQuery.of(context).size.width * 4 / 100,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: AppText(
                        text: current.description,
                        size: MediaQuery.of(context).size.width * 4 / 100,
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        iconSize: 30,
        color: Colors.black38,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

class FullStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.amber,
    );
  }
}

class HalfStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.star,
          color: Colors.grey,
        ),
        ClipRect(
          clipper: HalfClipper(),
          child: Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}

class QuarterStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.star,
          color: Colors.grey,
        ),
        ClipRect(
          clipper: QuarterClipper(),
          child: Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}

class ThreeQuarterStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.star,
          color: Colors.grey,
        ),
        ClipRect(
          clipper: ThreeQuarterClipper(),
          child: Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}

class QuarterClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width / 4, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class ThreeQuarterClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, 3 * size.width / 4, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
