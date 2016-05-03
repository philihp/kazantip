Kazantip
========

Demo Swift tip calculating app.

At its most core functionality, it calculates a tip for 20, 22, or 25 percent. Spec said 15, 20, and 22 percent, but we're better than that.

* [x] Required: User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Required: Settings page to change the default tip percentage.
* [ ] Optional: UI animations
* [ ] Optional: Remembering the bill amount across app restarts (if <10mins)
* [x] Optional: Using locale-specific currency and currency thousands separators.
* [x] Optional: Light/Dark Themes
* [x] Optional: Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

![Screenshot](https://github.com/philihp/kazantip/raw/master/Kazantip.gif)

Bonus Features!
--------------

* Checksum - Add a minimum amount of tip such that the pennies of the total will be a simple checksum of the other digits. This is useful if you suspect your waiter may modify the written tip amaount, perhaps turning an $11 tip on a $50 bill (22%) into $14 (28%). Turning an $11.07 tip into a $14.07 tip would result in a $64.07 total, and you could know to dispute this later.

* Palindrome - Similar to Checksum, this will add a minimum amount of tip such that the total will be a palindrome. This can be combined with Checksum for additional fun, however by doing so you might be adding a substantial tip.

* Young Jeezy Mode - This mode is exclusive to the above two modes. It will add a minimum amount of tip such that your total will payable in twenties. Since your pennies then would always be zero, you can't add a checksum. It should always be conceivable to create a palindrome multiple of twenty, but sometimes this tip may be extraordinarily high.

* Effective Tip - Because the tip added to your base percentage tip may be significant, an effective percentage tipped is displayed.

* App icon!
