# Vinyl Shop Mobile Application

<details>
<Summary><b>Assignment 7</b></summary>

## Steps
### Step 1: Create a new Flutter project
1. In the directory where I want to create the project, run the following command:
```
flutter create vinyl_shop
cd vinyl_shop
```
2. Choose several options to run the Flutter application such as using Chrome or Edge (I use Edge).
3. Run the following command
```
flutter config --enable-web
```
4. Create new file inside vinyl_shop/lib folder called `menu.dart` and add this line
```dart
import 'package:flutter/material.dart';
```
5. In the `main.dart` file, move class `MyHomePage` and `_MyHomePageState` to `menu.dart` file.
6. In the `main.dart` file, add this line
```dart
import 'package:vinyl_shop/menu.dart';
```
7. This will be the code for the `main.dart` file
```dart
import 'package:flutter/material.dart';
import 'package:vinyl_shop/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.cyan,
        ).copyWith(secondary: Colors.cyan[800]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
I added color scheme to the theme data.

### Step 2: Create 3 buttons (View, Add, Logout)
1. Before I create the buttons, I added a class to file `menu.dart` which is `InfoCard` to display my name and class.

2. For creating button card, I create a new class in the same file that contains attributes for each buttons.
```dart
class ItemHomepage {
    final String name;
    final IconData icon;

    ItemHomepage(this.name, this.icon);
}
```
3. In the `MyHomePage` class, I create a list of `ItemHomepage` and add 3 items along with their icon to the list.
```dart
final List<ItemHomepage> items = [
         ItemHomepage("View Product List", Icons.list),
         ItemHomepage("Add Product", Icons.add),
         ItemHomepage("Logout", Icons.logout),
];
```
3. I created a new class called `ItemCard` which is to display the buttons.

### Step 3: Implement different colors for each buttons
1. To implement different colors for each buttons, I modified class `MyHomePage` (specifically line 78).
```dart
// Display ItemCard for each item in the items list.
children: items.asMap().entries.map((entry) {
    int idx = entry.key;
    ItemHomepage item = entry.value;
    Color color;
    switch (idx) {
    case 0:
        color = Colors.cyan.shade800; // View
        break;
    case 1:
        color = Colors.lightBlue.shade800; // Add
        break;
    case 2:
        color = Colors.blue.shade800; // Logout
        break;
    default:
        color = Colors.cyan;
    }
    return ItemCard(item, color: color);
}).toList(),
```

### Step 4: Implement Snackbar with a message
1. In `ItemCard`, I added this to display the snackbar with the message.
```dart
child: InkWell(
        // Action when the card is pressed.
        onTap: () {
          // Display the SnackBar message when the card is pressed.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
        },
    ...
)
```

## What are stateless widgets and stateful widgets?
Stateful widgets are widgets that can change over time (example: a widget change when user interact with it). They are dynamic and can be updated.
Stateless widgets are widgets that cannot change over time (example: Icon, Text). They are static and cannot be updated.
The difference between them is that stateful widgets can change over time while stateless widgets cannot.

## The widgets that I have used for this project and its uses
Center: center its childern within itself.
Column: a widget that displays its children in a vertical array.
Container: a widget that allows you to customize its childern such as coloring, positioning, and sizing widgets.
Card: a widget that displays its children in a material design card.
Text: a widget that displays a string of text with a single style.
and many more.

## The use-case for `setState()`
Its primary mechanism for managing and updating the state of a widget or its child widgets. It is used to notify the framework that the internal state of the object has changed in a way that might impact the user interface in this subtree, which causes the build method to be called.
Any variable that is used in the widget's `build()` can be affected by `setState()`, some example of the variables are buttons, text, and styling.

## Difference between const and final keyword
`const` keywords are used to declare a variable that cannot be changed and are known at complied-time.
`final` keywords are used to declare a variable that can be assigned only once and only known at runtime.

</details>

<details>
<Summary><b>Assignment 8</b></summary>

## Steps
### Step 1: Create form page and display data in pop up message
1. Create a new file called 'vinylentry_form.dart' and add the following code:
```dart
import 'package:flutter/material.dart';
import 'package:vinyl_shop/widgets/left_drawer.dart';

class VinylEntryFormPage extends StatefulWidget {
  const VinylEntryFormPage({super.key});

  @override
  State<VinylEntryFormPage> createState() => _VinylEntryFormPageState();
}

class _VinylEntryFormPageState extends State<VinylEntryFormPage> {
  return Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text(
          'Add New Vinyl',
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Colors.white,
    ),
    // TODO: Add the created drawer here
    body: Form(
      child: SingleChildScrollView(), //makes the widgets scrollable
    ),
  );
}
```
2. I added `_formKey` with value `GlobalKey<FormState>();` to the _VinylEntryFormPageState class to validate the form. In addition, I created the input widgets for the form, such as name, description, price, and quantity.

3. For the text form field, I added the following code:
```dart
...
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Vinyl name",
            labelText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _name = value!;
            });
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Name cannot be empty!";
            }
            if (value.length > 100) {
              return "Name cannot be more than 100 characters!";
            }
            return null;
          },
        ),
      ),
      ...
    ],
  ),
```
This will create a text form field for the vinyl name. The `onChanged` function is used to update the value of `_name` when the user types in the text field. The `validator` function is used to validate the input value. If the value is empty or more than 100 characters, an error message will be displayed. I also added another text from field as the next child for description, price, and quantity.

4. I added a save button and display a pop-up message when the user presses the save button. The pop-up message will display the input values from the form.
```dart
...
  Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.secondary),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('New vinyl successfully added'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: $_name'),
                        Text('Description: $_description'),
                        Text('Price: $_price'),
                        Text('Quantity: $_quanity'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                        _formKey.currentState!.reset();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
...
```

### Step 2: Redirect user to the add form page when they press the `Add Product` button on the main page
1. I added this line inside the `onTap` function in the `ItemCard` class to navigate to the `VinylEntryFormPage` when the user presses the `Add Product` button in the Home Page.
```dart
...
  if (item.name == "Add Product") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VinylEntryFormPage(),
      ),
    );
  }
...
```

2. I also added a back button to the `VinylEntryFormPage` to navigate back to the Home Page (inside AppBar).
```dart
...
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
...
```

### Step 3: Creating a drawer
1. Create a new file called 'left_drawer.dart' and add the following code:
```dart
import 'package:flutter/material.dart';
import 'package:vinyl_shop/screens/menu.dart';
import 'package:vinyl_shop/screens/vinylentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Vinyl Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Find your favorite vinyl records!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.album),
            title: const Text('Add Vinyl'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VinylEntryFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```
DrawerHeader section is used to display the title and subtitle of the drawer.
The ListTile section is used to display the list of items(Home and Add Vinyl) in the drawer below the header. It also contains the onTap function to navigate to the respective page.
PushReplacement is used to replace the current page with the new page.

## Purpose of const in Flutter
Const is used to create immutable data objects. The advantage of using const is that it can improve performance by reducing the number of objects created in memory. 
- We should use const when the value of the object is known at compile time and will not change during runtime. (example: Text, Color) 
- We should not use const when the value of the object is not known at compile time or will change during runtime. (example: Text that will be updated based on user input)

## Column and Row
Column: A widget that displays its children in a vertical array. Example: list of buttons (View, Add, Logout) in home page
Row: A widget that displays its children in a horizontal array. Example: list of name, class, and npm in home page.

## List of input elements I used on the form page
- TextFormField: Used to get the input value from the user. Example: vinyl name, description, price, and quantity.
- ElevatedButton: Used to create a button that can be pressed. Example: save button.
- AlertDialog: Used to display a pop-up message. Example: display the input values from the form.

Other input elements that can be used are:
- DropdownButton: Used to create a dropdown list of items. Example: selecting a category.
- Checkbox: Used to create a checkbox. Example: selecting multiple items.
- Radio: Used to create a radio button. Example: selecting one item from a list.

## How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?
Yes, I implement a theme for my application. 
Inside my main.dart, I defined a theme using ThemeData constructor. I set the primary color to cyan and the secondary color to cyan[800]. 
I used the primary color as my header for main page and the drawer header. 

## How do you manage navigation in a multi-page Flutter application?
In a multi-page Flutter application, we can manage navigation using the Navigator class.
- To navigate to a new page, we can use the push method. Example: Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
- To navigate back to the previous page, we can use the pop method. Example: Navigator.pop(context);
- To replace the current page with a new page, we can use the pushReplacement method. Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewPage()));

</details>

<details>
<summary><b>Assignment 8</b></summary>

## Steps
### Step 1: Registration, Login, Logout
1. In the Django project, I created a new application `authentication`. In the views I created the function for login, register, and logout (along with their respective URLs).
2. I added 
```dart
return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
...
```
in my Flutter app (main.dart/classs MyApp) to create a CookieRequest instance and share it with all components in the Flutter app.
3. I created each page for the login and register form in Flutter.

### Step 2: Page for the product list
1. I created a new page named `product_entry.dart` for handling product data.
2. For diplaying the product list, I created `product_list.dart` which will display the name, description, price, and quantity of each added products.
3. I also added a new icon in the drawer which will direct to the product list page.
```dart
ListTile(
  leading: const Icon(Icons.add_box),
  title: const Text('Product List'),
  onTap: () {
      // Route to the mood page
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductPage()),
      );
  },
),
```
And also do the same for the View Product List button in the home page.
```dart
else if (item.name == "View Product List") {
  Navigator.push(context,
    MaterialPageRoute(
      builder: (context) => const ProductPage()
    ),
  );
}
```
4. To only shows product from logged-in user, I added this line in the `product_list.dart` file.
```dart
Future<List<Product>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    var data = response;
    
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }
```
which will only show the product from the logged-in user by checking the user id.

### Step 3: Page for showing a product's details
1. I first created a new page named `product_detail.dart` to display the details of a product.
2. In the `product_list.dart` file, I added this line to navigate to the product detail page when the user taps on a product.
```dart
 onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailsPage(product: product),
    ),
  );
},
``` 
3. In that page, the product's name, description, price, and quantity will be displayed. I also added
```dart
IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () => Navigator.pop(context), 
),
```
so it can redirect to the previous page or the product list page.

## Why we need to create a model to retrieve or send JSON data? Will an error occur if we don't create a model first?
We need to create a model to retrieve or send JSON data because it helps to parse the JSON data into Dart objects. Without a model, we would have to manually parse the JSON data, which can be error-prone and time-consuming. An error will not occur if we don't create a model first, but it is recommended to create a model to make the code more readable and maintainable.

## Purpose of the http library in this task
The http library is used to make HTTP requests to a server. In this task, we use the http library to send requests to the Django server to perform operations such as registration, login, logout, and fetching product data.

## Function of `CookieRequest` and why it's necessary to share the `CookieRequest` instance with all components in the Flutter app
When a Flutter application interfaces with a Django backend, CookieRequest makes sure that the stateful data required is appropriately stored and used throughout the application. By using this configuration, the complexity of manually controlling cookies and authentication headers in every HTTP request made by the application is reduced. Sharing the CookieRequest instance with all components ensures that the application maintains a consistent state and can access the necessary data for authentication and authorization.

## Mechanism of data transmission, from input to display in Flutter
1. The user inputs data in the Flutter application, such as registration details or login credentials.
2. The data is sent to the Django backend server using an HTTP request.
3. The Django server processes the data and performs the necessary operations, such as creating a new user account or authenticating the user.
4. The server sends a response back to the Flutter application with the result of the operation.
5. The Flutter application receives the response and displays the appropriate message or data to the user.

## Authentication mechanism from login, register, to logout. Start from inputting account data in Flutter to Django’s completion of the authentication process and display of the menu in Flutter.
Registration & Login:
1. The user inputs their account data (username, password) in the Flutter application.
2. The data is sent to the Django backend server using an HTTP POST request to the login endpoint.
3. The Django server verifies the user's credentials and generates a session token.
4. The server sends the session token back to the Flutter application in the response.
5. The Flutter application stores the session token using the CookieRequest instance for future requests.

Logout:
1. The user clicks the logout button in the Flutter application.
2. The Flutter application sends an HTTP POST request to the logout endpoint on the Django server.
3. The Django server invalidates the session token associated with the user.
4. The server sends a response back to the Flutter application confirming the logout.

Display Menu:
1. The user is authenticated and logged in.
2. The Flutter application sends an HTTP GET request to the product list endpoint on the Django server.
3. The Django server retrieves the list of products associated with the user.
4. The server sends the list of products back to the Flutter application in the response.
5. The Flutter application displays the product list in the menu.

</details>