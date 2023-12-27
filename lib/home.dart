import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perpussy', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Mengatur radius melengkung
          ),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenreListWidget(),
          Expanded(
            child: BookmarkListWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            // Navigate to Home page
            // You can add your logic here if needed
          } else if (index == 1) {
            // Navigate to Bookmark page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookmarkPage(),
              ),
            );
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

class GenreListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Fiction",
      "Science Fiction",
      "Mystery",
      "Fiction",
      "Science Fiction",
      "Mystery"
    ];

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add logic to filter books based on genre
              },
              child: Text(genres[index]),
            ),
          );
        },
      ),
    );
  }
}

class BookmarkListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy list of books, you can replace this with actual book data
    List<String> books = ["Book 1", "Book 2", "Book 3"];

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(books[index]),
          subtitle: Text('Available'),
          trailing: ElevatedButton(
            onPressed: () {
              // Add logic for renting the book
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Peminjaman Buku'),
                    content: Text('Anda telah meminjam ${books[index]}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Add'),
          ),
        );
      },
    );
  }
}
