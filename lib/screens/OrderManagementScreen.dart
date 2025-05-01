import 'package:flutter/material.dart';

class OrderManagementScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'name': 'Hoàng Trung',
      'orderId': '123454',
      'email': 'h***05@gmail.com',
      'phone': '+84353***166',
    },
    {
      'name': 'Phong Nguyen',
      'orderId': '123454',
      'email': 'h***05@gmail.com',
      'phone': '+84353***166',
    },
    {
      'name': 'Thuat Nguyen',
      'orderId': '123454',
      'email': 'h***05@gmail.com',
      'phone': '+84353***166',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("28 Tháng 02, 2025 - 16:00", style: TextStyle(fontSize: 16, color: Colors.white)),
            Text(
              "Nhà Hát Kịch IDECAF: Đức Thượng Công Tử Quận Lê...",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton("Doanh thu", false),
                _buildTabButton("Check-in", false),
                _buildTabButton("Đơn hàng", true),
              ],
            ),
            SizedBox(height: 16),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search orders',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 12),

            // Filter Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterChip("Tất cả", true),
                _buildFilterChip("Đã checkin", false),
                _buildFilterChip("Chưa checkin", false),
              ],
            ),
            SizedBox(height: 16),

            // Order count
            Text("Có 1.324 đơn hàng", style: TextStyle(color: Colors.white)),

            SizedBox(height: 8),

            // Order list
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return _buildOrderCard(order);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Column(
      children: [
        Text(text, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        if (isSelected)
          Container(
            height: 2,
            width: 60,
            color: Colors.green,
          ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool selected) {
    return Chip(
      label: Text(label, style: TextStyle(color: selected ? Colors.white : Colors.black)),
      backgroundColor: selected ? Colors.green : Colors.grey[300],
    );
  }

  Widget _buildOrderCard(Map<String, String> order) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(order['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text("Mã đơn hàng: ${order['orderId']}", style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email\n${order['email']}", style: TextStyle(color: Colors.white70)),
                Text("Số điện thoại\n${order['phone']}", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}
