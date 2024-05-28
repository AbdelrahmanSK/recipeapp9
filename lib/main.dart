import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orange,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Comfortaa'), // Set Comfortaa font for headline6
          bodyText1: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Comfortaa'), // Set Comfortaa font for bodyText1
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Comfortaa'), // Set Comfortaa font for bodyText2
        ),
      ),
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Check credentials
                    if (_username == "Susssos" && _password == "Amogus1234") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecipeHome()),
                      );
                    } else if (_username == "Admos" && _password == "LOSHelios") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminPage()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Invalid username or password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RecipeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: RecipeList(),
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Spaghetti Carbonara',
      ingredients: ['Spaghetti', 'Eggs', 'Bacon', 'Parmesan cheese', 'Black pepper'],
      instructions: [
        'Cook spaghetti according to package instructions.',
        'Fry bacon until crispy, then chop into small pieces.',
        'In a bowl, mix eggs, grated Parmesan cheese, and black pepper.',
        'Add cooked spaghetti to the bacon pan, then pour the egg mixture over it, stirring quickly to coat.',
        'Serve immediately with extra Parmesan cheese and black pepper.'
      ],
      imagePath: 'assets/images/placeholder1.jpg',
    ),
  
    Recipe(
      name: 'Chicken Alfredo',
      ingredients: ['Fettuccine pasta', 'Chicken breast', 'Heavy cream', 'Garlic', 'Parmesan cheese'],
      instructions: [
        'Cook fettuccine pasta according to package instructions.',
        'In a pan, cook chicken breast until no longer pink, then remove and slice.',
        'In the same pan, add minced garlic and cook until fragrant.',
        'Pour in heavy cream and simmer until slightly thickened.',
        'Add cooked pasta and sliced chicken to the sauce, then toss to combine.',
        'Serve hot with grated Parmesan cheese on top.'
      ],
      imagePath: 'assets/images/placeholder2.jpg',
    ),
    Recipe(
      name: 'Beef Stroganoff',
      ingredients: ['Beef sirloin', 'Onion', 'Mushrooms', 'Sour cream', 'Dijon mustard'],
      instructions: [
        'Slice beef sirloin into thin strips.',
        'Sauté onion and mushrooms until softened.',
        'Add beef strips and cook until browned.',
        'Stir in sour cream and Dijon mustard, then simmer until heated through.',
        'Serve hot over cooked noodles or rice.'
      ],
      imagePath: 'assets/images/placeholder3.jpg',
    ),
    Recipe(
      name: 'Margherita Pizza',
      ingredients: ['Pizza dough', 'Tomatoes', 'Fresh mozzarella cheese', 'Fresh basil leaves', 'Olive oil'],
      instructions: [
        'Roll out pizza dough into a round shape.',
        'Spread olive oil over the dough, then add sliced tomatoes and fresh mozzarella cheese on top.',
        'Bake in a preheated oven until crust is golden brown and cheese is melted.',
        'Remove from oven, sprinkle fresh basil leaves on top, and serve hot.'
      ],
      imagePath: 'assets/images/placeholder4.jpg',
    ),
    Recipe(
      name: 'Chocolate Chip Cookies',
      ingredients: ['All-purpose flour', 'Butter', 'Brown sugar', 'Granulated sugar', 'Chocolate chips'],
      instructions: [
        'Cream together butter, brown sugar, and granulated sugar until smooth.',
        'Mix in flour until a dough forms, then fold in chocolate chips.',
        'Drop spoonfuls of dough onto a baking sheet and bake in a preheated oven until edges are golden brown.',
        'Let cool on the baking sheet for a few minutes before transferring to a wire rack to cool completely.'
      ],
      imagePath: 'assets/images/placeholder5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(recipes[index].imagePath),
              radius: 25,
            ),
            title: Text(
              recipes[index].name,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeDetails(recipe: recipes[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  RecipeDetails({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            recipe.imagePath,
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recipe.ingredients.map((ingredient) {
                    return Text('- $ingredient');
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text(
                  'Instructions:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recipe.instructions.asMap().entries.map((entry) {
                    return Text('${entry.key + 1}. ${entry.value}');
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final String imagePath;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.imagePath,
  });
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Page',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome Admin!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
