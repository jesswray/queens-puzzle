# queens-puzzle

> Provided an IPv4 address, say 8.8.8.8, use a RESTful client to get the result from ipinfo.io (e.g. http://ipinfo.io/8.8.8.8) and take the altitude geocoordinate, casting it to an integer N. Then, use N to construct an N x N chess board. Randomly assign N/2 unique coordinates on which a Queen will sit. No other pieces will be on the board. Your program should then determine if all of the queens are placed in such a way where none of them are attacking each other.

> If this is true for the given inputs, return the string true,
otherwise return each pair of attacking Queens.

You must have Ruby installed to run this code.

To run from the CLI:
```
git clone https://github.com/wrayjs/queens-puzzle.git
cd queens-puzzle
bundle install
ruby lib/cli.rb
```

or call the program directly
```
// ♥ irb
:001 > require './lib/app'
 => true
:002 > App.new('209.191.122.70').run
 => [[[7, 31], [7, 5]], [[7, 5], [31, 5]], [[7, 5], [5, 3]], [[33, 24], [35, 26]], [[5, 16], [5, 3]], [[4, 26], [35, 26]], [[36, 32], [30, 32]]]
```

To run specs:
```
bundle exec rspec
```


