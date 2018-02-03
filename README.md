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

To run specs:
```
bundle exec rspec
```


