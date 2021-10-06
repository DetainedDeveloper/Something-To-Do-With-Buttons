# Project Structure
- Project is made using MVC pattern and Provider for **`State Management`**

1. ### [**`core`**](https://github.com/DetainedDeveloper/Something-To-Do-With-Buttons/tree/master/pitc_test/lib/core) contains enums, app routes and utilities

2. ### [**`project`**](https://github.com/DetainedDeveloper/Something-To-Do-With-Buttons/tree/master/pitc_test/lib/project) contains all code for **`data(model)`**, **`logic(controller)`** and **`ui(view)`**
  - I ususally name it **`features`** and each **`feature`** has it's own **`M, V and C`**, but it wasn't required in this case

# Flow

1. ### [Button Model](https://github.com/DetainedDeveloper/Something-To-Do-With-Buttons/blob/master/pitc_test/lib/project/model/button_model.dart)

    - **`ButtonModel`** is an **`abstract`** class, so it can never be initialized accidentally
    
    - **`ButtonModel`** contains data such as total amount of buttons to show, a **`list`** containing state of each button (**`inactive, blue or green`**) and total amount of green buttons
    
    - All of the members can only be accessed using getters and setters and static methods

2. ### [Button Controller](https://github.com/DetainedDeveloper/Something-To-Do-With-Buttons/blob/master/pitc_test/lib/project/controller/button_controller.dart)

    - **`ButtonController`** contains all logic and methods and is used by **`UI`** to call methods on User Ineteraction

3. ### Provider

    - **`Provider`** passes down single instance of **`ButtonController`** down the widget tree
    
    - Using **`notifylisteners()`** will automatically update the listeners in **`UI`**

# Logic

- Firstly, raw user input is passed to **`ButtonController`**, it uses a [**`utility`**](https://github.com/DetainedDeveloper/Something-To-Do-With-Buttons/blob/master/pitc_test/lib/core/utils.dart) to determine the given input is appropriate or not (a non-zero number less than 25)

- If it's correct, total amount of buttons to show is determined and second screen opens displaying same amount of buttons

- Whenever a Button is pressed, **`changeButtonState()`** is called

```dart
void changeButtonState(int current) {

    /// Check if the button pressed [current] by the user is blue or not
    if (getButtonState(current) == ButtonState.blue) {
      
      /// If it is blue, then make it green
      ButtonModel.setButtonState(current, ButtonState.green);
      
      /// Increase green count by 1
      ButtonModel.increaseGreenCount();

      /// Generate a new random button's index
      /// [next] meaning the next button that is going to become blue
      int next = Random().nextInt(totalButtons);

      /// While green button count is lower than total buttons
      while (greenButtonCount < totalButtons) {
        
        /// Check if the button at generated new index [next]
        if (getButtonState(next) == ButtonState.green) {
          
          /// If it is, generate a new random button less than [totalButtons]
          next = Random().nextInt(totalButtons);
        } else {
          
          /// If it's not green, turn the new one into blue!
          /// And break the loop
          ButtonModel.setButtonState(next, ButtonState.blue);
          break;
        }
      }
    }

    /// Notify listeners when button state is changed
    notifyListeners();
  }
```
