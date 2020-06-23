# smart_progress_bar

Flutter is a progress bar that you can easily use the library in many ways.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Example

![GitHub Logo](https://github.com/followthemoney1/smart_progress_bar/blob/master/g.gif?raw=true)

## Usage

First you need to add a library to `pubspec.yaml`:
```
dependencies:
  smart_progress_bar: ^0.1.2
```


Now you can call the progress bar while your code is executed in the following way:
```
showProgressBar(whileRun: () async {
 //any code
});
```

or

```
showProgressBar(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    text: "Any hint",
    whileRun: () {
    //any code
    },
);
```


Or you can use the progress bar by adding it to your asynchronous function:
```
final res = await validateAndSubmit().showProgressBar();
```


All fields:
```
showProgressBar(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    text: "Any hint",
    backgroundColorHex:"#000000",
    textColorHex:"#ffffff",
    whileRun: () {
     //any code
     },
);

 //

Function<T>.showProgressBar(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    text: "Any hint",
    backgroundColorHex:"#000000",
    textColorHex:"#ffffff"
);
```