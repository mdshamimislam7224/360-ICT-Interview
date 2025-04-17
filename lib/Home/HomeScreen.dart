import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasNotification = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 375;
    final padding = isSmallScreen ? 16.0 : 20.0;
    final avatarRadius = isSmallScreen ? 22.0 : 25.0;
    final notificationSize = isSmallScreen ? 14.0 : 16.0;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[400],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header Section
                    Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            const Color(0xFF00F97B).withOpacity(0.10)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1902',
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 12 : 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: isSmallScreen ? 4 : 6),
                                      Text(
                                        'Good Morning',
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 16 : 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: isSmallScreen ? 4 : 6),
                                      Text(
                                        'Ahmed Ariyan',
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 20 : 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _hasNotification = false;
                                    });
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        radius: avatarRadius,

                                        backgroundImage: const AssetImage('images/profile_icon.png'),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 20),
                            Text.rich(
                              TextSpan(
                                text: 'You are in a ',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 14 : 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'healthy ',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: 'environment'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Content Section
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'My Places',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildPlaceCard(
                                    'Home',
                                    '652',
                                    Colors.blue,
                                    isSmallScreen: isSmallScreen,
                                  ),
                                ),
                                SizedBox(width: isSmallScreen ? 10 : 15),
                                Expanded(
                                  child: _buildPlaceCard(
                                    'Office',
                                    '447',
                                    Colors.orange,
                                    isSmallScreen: isSmallScreen,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 20),
                            buildCustomPlaceCard(
                              title: 'Home',
                              value: '652',
                              percentage: '13%',
                              color: Colors.green,
                              status: 'Good',
                              isSmallScreen: MediaQuery.of(context).size.width < 360,
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            buildCustomPlaceCard(
                              title: 'Home',
                              value: '652',
                              percentage: '13%',
                              color: Colors.green,
                              status: 'Good',
                              isSmallScreen: MediaQuery.of(context).size.width < 360,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceCard(
      String title, String value, Color color, {required bool isSmallScreen}) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isSmallScreen ? 6 : 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: isSmallScreen ? 4 : 5),
              Text(
                'ppm',
                style: TextStyle(
                  fontSize: isSmallScreen ? 12 : 14,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCustomPlaceCard({
    required String title,
    required String value,
    required String percentage,
    required Color color,
    required String status,
    required bool isSmallScreen,
  }) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title & Status Pill
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Reading Section
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: isSmallScreen ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_downward, size: 14, color: Colors.green),
                    const SizedBox(width: 2),
                    Text(
                      percentage,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'ppm',
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Bottom: Avatars + View Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    left: 0,
                    child: _buildAvatar('images/profile_icon.png'),
                  ),
                  Positioned(
                    left: 20,
                    child: _buildAvatar('images/microsoft_icon.png'),
                  ),
                  Positioned(
                    left: 40,
                    child: _buildAvatar('images/profile_icon.png'),
                  ),
                  Positioned(
                    left: 60,
                    child: _buildMoreAvatar('+2'),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text(
                  'View Details',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: color,
                  padding: EdgeInsets.zero,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildAvatar(String path) {
    return CircleAvatar(
      radius: 16,
      backgroundImage: AssetImage(path),
    );
  }

  Widget _buildMoreAvatar(String label) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.grey[300],
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }


}