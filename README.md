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