# smart_progress_bar

A new Flutter package.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Example

![GitHub Logo](/g.gif)

## Usage

You can easily use the library in many ways.
You can call the progress bar while your code is executed in the following way:
```
SmartProgressBar.showProgressBar(whileRun: () async {
                      //any code
                    });
```
or
```
 SmartProgressBar.showProgressBar(
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        text: "Any hint",
                        //backgroundColorHex:"#000000",
                        //textColorHex:"#ffffff",
                        whileRun: () {
                         //any code
                        });
```


Or you can use the progress bar by adding it to your asynchronous function:
```
final res = await validateAndSubmit().withSmartProgressBar();
```
