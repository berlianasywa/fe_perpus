import 'package:flutter/material.dart';
import 'profile.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  int _currentIndex = 1; // Indeks untuk menentukan halaman aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Bookmark', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Mengatur radius melengkung
          ),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: BookmarkListWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update indeks saat pengguna mengetuk menu
          });
          if (index == 0) {
            // Navigate to Home page
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (index == 1) {
            // No action needed as we are already on the Bookmark page
          } else if (index == 2) {
            // Navigate to Profile page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors
            .blueGrey.shade700, // Mengatur warna latar belakang menu bawah
        selectedItemColor: const Color.fromARGB(
            255, 111, 209, 255), // Mengatur warna ikon dan teks item yang aktif
        unselectedItemColor:
            Colors.white, // Mengatur warna ikon dan teks item yang tidak aktif
      ),
    );
  }
}

class BookmarkListWidget extends StatefulWidget {
  @override
  State<BookmarkListWidget> createState() => _BookmarkListWidgetState();
}

class _BookmarkListWidgetState extends State<BookmarkListWidget> {
  List<String> bookmarkedBooks = ["Book 1", "Book 3"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookmarkedBooks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(bookmarkedBooks[index]),
          subtitle: Text('In Wishlist'),
        );
      },
    );
  }
}
