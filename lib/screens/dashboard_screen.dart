import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rp 300.000",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              children: [
                Icon(Icons.arrow_drop_down, color: Colors.white),
                Icon(Icons.notifications, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Main Menu
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMainMenuIcon(Icons.qr_code, "Scan"),
                _buildMainMenuIcon(Icons.account_balance_wallet, "Top Up"),
                _buildMainMenuIcon(Icons.send, "Send"),
                _buildMainMenuIcon(Icons.request_page, "Request"),
              ],
            ),
          ),

          // Categories Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Layanan",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                _buildServiceCategories(),
              ],
            ),
          ),

          // Nearby Merchants Section
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nearby Me",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: Text("VIEW ALL"))
              ],
            ),
          ),
          _buildNearbyMerchants(),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: "Pay"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_travel), label: "Pocket"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
        ],
      ),
    );
  }

  Widget _buildMainMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildServiceCategories() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildServiceCategory(
            Icons.phone, "Pulsa & Data", Colors.red, "Bonus Pulsa 50%", true),
        _buildServiceCategory(Icons.sports_esports, "Games", Colors.blue),
        _buildServiceCategory(Icons.bolt, "Electricity", Colors.orange),
        _buildServiceCategory(Icons.health_and_safety, "BPJS", Colors.green),
        _buildServiceCategory(Icons.phone_android, "Telephone", Colors.purple),
        _buildServiceCategory(Icons.payment, "Post Paid", Colors.blue),
        _buildServiceCategory(Icons.money_off, "Cashout", Colors.green),
        _buildServiceCategory(Icons.emoji_emotions, "DANA Kaget", Colors.blue),
        _buildServiceCategory(Icons.more_horiz, "See All", Colors.grey),
      ],
    );
  }

  Widget _buildServiceCategory(IconData icon, String label, Color color,
      [String subtitle = "", bool hasButton = false]) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center),
          if (subtitle.isNotEmpty)
            Text(subtitle, style: TextStyle(color: color, fontSize: 12)),
          if (hasButton)
            TextButton(
              onPressed: () {},
              child: Text("BUY NOW",
                  style: TextStyle(fontSize: 10, color: Colors.blue)),
            )
        ],
      ),
    );
  }

  Widget _buildNearbyMerchants() {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildMerchantCard("G7", "9.9 km"),
          _buildMerchantCard("KFC", "1.5 km"),
          _buildMerchantCard("Coffee Bean", "5 km"),
          _buildMerchantCard("Baskin Robbins", "6 km"),
          _buildMerchantCard("Baso by Wisteria", "6 km"),
        ],
      ),
    );
  }

  Widget _buildMerchantCard(String name, String distance) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.store, color: Colors.blue, size: 32),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(distance, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
