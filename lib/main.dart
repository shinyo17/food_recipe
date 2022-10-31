import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "수제버거",
        "imgUrl":
            "https://i.ibb.co/HBGKYn4/foodiesfeed-com-summer-juicy-beef-burger.jpg",
      },
      {
        "category": "건강식",
        "imgUrl":
            "https://i.ibb.co/mB5YNs2/foodiesfeed-com-pumpkin-soup-with-pumpkin-seeds-on-top.jpg",
      },
      {
        "category": "한식",
        "imgUrl":
            "https://i.ibb.co/Kzzpc97/Beautiful-vibrant-shot-of-traiditonal-Korean-meals.jpg",
      },
      {
        "category": "디저트",
        "imgUrl":
            "https://i.ibb.co/DL5vJVZ/foodiesfeed-com-carefully-putting-a-blackberry-on-tiramisu.jpg",
      },
      {
        "category": "피자",
        "imgUrl": "https://i.ibb.co/qsm8QH4/pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl":
            "https://i.ibb.co/yQDkq2X/foodiesfeed-com-hot-shakshuka-in-a-cast-iron-pan.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _SearchBar(),
            Divider(),
            _RecipeList(dataList: dataList),
          ],
        ),
      ),
      drawer: _Drawer(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        "Food Recipe",
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print("hello");
          },
          icon: Icon(
            Icons.person_outline,
          ),
        ),
      ],
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _drawerHeader(),
          _banner(),
          _menu(context, '구매내역'),
          _menu(context, '저장한 레시피'),
        ],
      ),
    );
  }

  ListTile _menu(
    BuildContext context,
    String title,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  DrawerHeader _drawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                  width: 62,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "타이가",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "17shinyo17@gmail.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AspectRatio _banner() {
    return AspectRatio(
      aspectRatio: 12 / 4,
      child: PageView(
        children: [
          Image.network(
            "https://i.ibb.co/Q97cmkg/sale-event-banner1.jpg",
          ),
          Image.network(
            "https://i.ibb.co/GV78j68/sale-event-banner2.jpg",
          ),
          Image.network(
            "https://i.ibb.co/R3P3RHw/sale-event-banner3.jpg",
          ),
          Image.network(
            "https://i.ibb.co/LRb1VYs/sale-event-banner4.jpg",
          ),
        ],
      ),
    );
  }
}

class _RecipeList extends StatelessWidget {
  const _RecipeList({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  final List<Map<String, dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> foodData = dataList[index];

          return _recipeCard(foodData);
        },
      ),
    );
  }

  Card _recipeCard(Map<String, dynamic> foodData) {
    String category = foodData["category"];
    String imgUrl = foodData["imgUrl"];

    return Card(
      margin: EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            imgUrl,
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 120,
            color: Colors.black.withOpacity(0.5),
          ),
          Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
            ),
          )
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "상품을 검색해 주세요.",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
