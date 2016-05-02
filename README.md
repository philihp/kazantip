Kazantip
========

Demo Swift tip calculating app.

At its most core functionality, it calculates a tip for 20, 22, or 25 percent. Spec said 15, 20, and 22 percent, but we're better than that.

Bonus Features!
--------------

* Checksum - Add a minimum amount of tip such that the pennies of the total will be a simple checksum of the other digits. This is useful if you suspect your waiter may modify the written tip amaount, perhaps turning an $11 tip on a $50 bill (22%) into $14 (28%). Turning an $11.07 tip into a $14.07 tip would result in a $64.07 total, and you could know to dispute this later.

* Palindrome - Similar to Checksum, this will add a minimum amount of tip such that the total will be a palindrome. This can be combined with Checksum for additional fun, however by doing so you might be adding a substantial tip.

* Young Jeezy Mode - This mode is exclusive to the above two modes. It will add a minimum amount of tip such that your total will payable in twenties. Since your pennies then would always be zero, you can't add a checksum. It should always be conceivable to create a palindrome multiple of twenty, but sometimes this tip may be extraordinarily high.

* Effective Tip - Because the tip added to your base percentage tip may be significant, an effective percentage tipped is displayed.

* Localized! Currency amounts are formatted in the local iPhone's currency, and digit groupings in the current locale's style.

* App icon!
