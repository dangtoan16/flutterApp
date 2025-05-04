import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/screens/OrderManagementScreen.dart';


class RevenueScreen extends StatefulWidget {
  @override
  State<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<RevenueScreen> {
  String selectedTab = "Doanh thu"; // Trạng thái tab hiện tại

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
            Text("28 Tháng 02, 2025 - 16:00", style: TextStyle(color: Colors.white, fontSize: 16)),
            Text(" Những Thành Phố Mơ Màng Year End 2024...", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs: Doanh thu + Đơn hàng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = "Doanh thu";
                    });
                  },
                  child: _buildTab("Doanh thu", selectedTab == "Doanh thu"),
                ),
                GestureDetector(
                  onTap: () {
                    // 👉 Điều hướng sang màn hình đơn hàng
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OrderManagementScreen()),
                    );
                  },
                  child: _buildTab("Đơn hàng", selectedTab == "Đơn hàng"),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Nội dung doanh thu
            if (selectedTab == "Doanh thu") ...[
              Text("Tổng quan", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleStat(
                    title: "Doanh thu",
                    value: "500.000.000đ",
                    total: "600.000.000đ",
                    percent: 78,
                  ),
                  _buildCircleStat(
                    title: "Số lượng vé đã bán",
                    value: "1.235 vé",
                    total: "2000 vé",
                    percent: 87,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _buildFilter("30 ngày", true),
                  SizedBox(width: 8),
                  _buildFilter("24 giờ", false),
                ],
              ),
              SizedBox(height: 12),
              Expanded(child: _buildChart()),
            ],
          ],
        ),
      ),
    );
  }

  // 👉 Tab builder
  Widget _buildTab(String label, bool selected) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: selected ? Colors.white : Colors.grey)),
        SizedBox(height: 4),
        if (selected) Container(height: 2, width: 50, color: Colors.green),
      ],
    );
  }

  // 👉 Thống kê dạng vòng tròn
  Widget _buildCircleStat({required String title, required String value, required String total, required int percent}) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                    Text("Tổng: $total", style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: percent / 100,
                      backgroundColor: Colors.grey,
                      color: Colors.green,
                      strokeWidth: 5,
                    ),
                    Center(child: Text("$percent%", style: TextStyle(fontSize: 10, color: Colors.white))),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 👉 Nút lọc thời gian
  Widget _buildFilter(String label, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  // 👉 Biểu đồ doanh thu
  Widget _buildChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 150,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final labels = ['20T10', '21', '22', '23', '24', '25', '26T10'];
                if (value.toInt() < labels.length) {
                  return Text(labels[value.toInt()], style: TextStyle(color: Colors.white, fontSize: 10));
                }
                return Container();
              },
              reservedSize: 30,
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          _barGroup(0, 30),
          _barGroup(1, 50),
          _barGroup(2, 90),
          _barGroup(3, 110),
          _barGroup(4, 100),
          _barGroup(5, 60),
          _barGroup(6, 30),
        ],
      ),
    );
  }

  BarChartGroupData _barGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16,
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
