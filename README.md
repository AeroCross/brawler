
# Brawler

[Heroes of the Storm](http://us.battle.net/heroes/en/) game data (heroes, abilities, talents, etc.), Ruby-style.

Data provided by [heroesjson.com](http://heroesjson.com).

## Usage

In your `Gemfile` or just in your command line:

```
gem install brawler
```

And then

```
require "brawler"
```

Unless you're using Rails — in that case, congratulations! You don't have to deal with loading. I'm jealous.

## Available classes and methods

### `Brawler.hero`
```
Brawler.hero(value, by:)
```

`by` can be either `:name` (by default) or `:role`.

```
Brawler.hero("Abathur")
=> Brawler::Hero<@name="Abathur">
Brawler.hero("Support", by: :role)
=> [Brawler::Hero<@name="Brightwing">, Brawler::Hero<@name="Tassadar">...]
```

### `Brawler::Hero`

This contains hero data.

- `#name`
- `#title`
- `#description`
- `#role`
- `#type`
- `#franchise`
- `#difficulty`
- `#release_date`

This uses `Brawler::Finder::HeroFinder`, which has a lot of incomplete finder methods. Check it out if you like danger.

## Test suite

This is tested using **RSpec**. Just run `rspec` in the root directory and enjoy the greens and the ocassional yellow.

## TODO

- Abilities per hero
- Abilities finder
- Hero ratings, stats, talents
- Download the latest data from [heroesjson.com](http://heroesjson.com)

## License

MIT.
