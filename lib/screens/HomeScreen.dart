import 'package:flutter/material.dart';
import 'package:flutter_application/screens/RevenueScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<EventItem> events = [
    EventItem(
      title: '[TP.HCM] Những Thành Phố Mơ Màng Year End 2024',
      imageUrl: 'https://salt.tkbcdn.com/ts/ds/ee/04/57/30c09e53caaf0abe6a9f1b316818dc68.jpg', 
    ),
    EventItem(
      title: '[Nhà Hát THANH NIÊN] Hài kịch: Lạc lối ở BangKok',
      imageUrl: 'https://salt.tkbcdn.com/ts/ds/c2/5e/17/ae586542ae74e9ef16c9f61baff4f52c.png',
    ),
    EventItem(
      title: '1900 Future Hits #61: Quang Hùng MasterD | Thursday 21.11.2024',
      imageUrl: 'https://salt.tkbcdn.com/ts/ds/8a/a3/1f/ed4eaf99be013c372e9521c26067d852.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Organizer Center'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _buildTabSelector(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return _buildEventCard(context, events[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // Widget nút chọn "Sắp tới" / "Đã qua"
  Widget _buildTabSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          _tabButton("Sắp tới", true),
          const SizedBox(width: 10),
          _tabButton("Đã qua", false),
        ],
      ),
    );
  }

  // Nút tab
  Widget _tabButton(String label, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  // Widget hiển thị từng sự kiện
  Widget _buildEventCard(BuildContext context, EventItem event) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFF1B1B1B),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(event.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
        const SizedBox(height: 8),
        Text(event.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  // Chuyển màn hình sang RevenueScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RevenueScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                ),
                child: const Text('Quản lý', style: TextStyle(color: Colors.green)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Quét vé'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


  // Bottom navigation bar
  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Sự kiện'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
      ],
    );
  }
}

// Model đơn giản cho sự kiện
class EventItem {
  final String title;
  final String imageUrl;

  EventItem({required this.title, required this.imageUrl});
}
