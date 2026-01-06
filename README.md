# 🎱 Magic 8-Ball (Bloc Practice)

A simple, fun Flutter application that gives you answers to your deepest "yes/no" questions. This project was built specifically to master **State Management using the Bloc Pattern**.
Hopefully this will help whoever has an issue with bloc management

## 🚀 The Purpose

The goal of this project was to move away from `setState()` and implement a clean architecture where the UI and business logic are completely decoupled.

## 🛠 Features

* **Predictive Answers:** Tap the ball to get a randomized lucky response.
* **Bloc State Management:** Uses `Events` to trigger shakes and `States` to handle UI updates.
* **Clean UI:** Minimalist design with smooth transitions between answers.

## 🏗 Bloc Implementation

In this app, the logic is split into three main components:

1. **Events (`EightBallEvent`):**
* `ShakeBall`: Triggered when the user taps the 8-ball or a button.


2. **States (`EightBallState`):**
* `EightBallInitial`: The default "Ask me anything" state.
* `EightBallLoading`: A brief state to simulate the ball "thinking."
* `EightBallAnswered`: Contains the randomized answer string and image path.


3. **Bloc (`EightBallBloc`):**
* Maps the `ShakeBall` event to a random selection logic and emits the result.



## 📸 Demo

| Initial State | Thinking State | Result State |
| --- | --- | --- |
|  |  |  |

## ⚙️ Setup & Installation

1. **Clone the repo:**
```bash
git clone https://github.com/JulezD3z/eight-ball-bloc.git

```


2. **Install dependencies:**
```bash
flutter pub get

```

3. **Run the app:**
```bash
flutter run

```



## 🧠 What I Learned

* How to use the VS Code Bloc extension to generate boilerplate code.
* The difference between `part` and `part of` in Dart.
* How to use `BlocProvider` to make the Bloc available to the widget tree.
* Using `BlocBuilder` to rebuild only the specific parts of the UI that change.

---

### Pro-Tip for your README

If you want to make this look even better on GitHub, you can add a section for **"Folder Structure"** to show off how organized your Bloc files are:

```text
lib/
├── bloc/
│   ├── eight_ball_bloc.dart
│   ├── eight_ball_event.dart
│   └── eight_ball_state.dart
├── widgets/
│   └── ball_display.dart
└── main.dart

