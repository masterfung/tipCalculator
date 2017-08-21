# Pre-work - *TipCalculator*

**TipCalculator** is an awesome app that calculates tips on iOS.

Submitted by: **Tsung Hung**

Time spent: 3.5** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Colorful Page
- [X] App Icons
- [X] Used Open Sans for fonts instead of system default
- [X] Tip split up to 3 people
- [X] Font Awesome submodule system with gear icon for settings

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![gif](https://github.com/masterfung/tipCalculator/blob/master/TsungHungTipCalculatorDemo.gif)

An updated walkthrough with the optional and additional features added:

![gif](https://github.com/masterfung/tipCalculator/blob/master/TipCalc2.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** Outlets allows deverloper to change properties to the Controller while Actions are used for events to apply/trigger code to intiate some functionality.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**  To insure strong reference cycle with deallocation at the end of usage, developer needs to insure they do not use strong reference cycle between the closure and the variables declared in the class. Instead, they should use unowned (making sure there is no nil or the app will crash) or use weak reference so the deallocation will happen when the program or class has been used. 


## License

    Copyright 2017 Tsung Hung

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.