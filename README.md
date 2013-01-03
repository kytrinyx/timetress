# Timetress

Knows about workdays and holidays, public and otherwise.
Answers the age-old question _When is mothersday this year?_.

[![Build Status](https://secure.travis-ci.org/kytrinyx/timetress.png?branch=master)](http://travis-ci.org/kytrinyx/timetress)

## Installation

Add this line to your application's Gemfile:

    gem 'timetress'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timetress

## Usage

### Timetress knows about holidays

```
Timetress.christmas 2012
=> #<Date: 2012-12-25>
```

```
# On New Year's Eve, 2011
Timetress.next_christmas
=> #<Date: 2012-12-25>
```

```
# On Christmas Day, 2012
Timetress.previous_christmas
=> #<Date: 2011-12-25>
```

### Public Holidays (Norway only)

> A public holiday, national holiday or legal holiday is a holiday generally established by law and is usually a non-working day during the year.
> - Wikipedia

Timetress::Norway.public_holidays(2012)
=> [#<Date: 2012-01-01>, #<Date: 2012-04-05>,...]

### Workdays

A workday is a day of the week which is neither a weekend, nor a public holiday.

```
Timetress::Norway.workday? Date.new(2012, 1, 5)
 => true

Timetress::Norway.workday? Date.new(2012, 5, 17)
 => false
```

In calculating deadlines and lead time, it's often helpful to count workdays:

```
Timetress::Norway.nth_workday_before 4, Date.new(2012, 10, 25)
 => #<Date: 2012-10-19>

Timetress::Norway.nth_workday_after 1, Date.new(2012, 10, 25)
 => #<Date: 2012-10-26>
```

## Implemented holidays (Norway)

Public holidays are emphasized below.

* *New Year's Day*: January 1st.
* Mothersday: Second Sunday in February.
* Valentines Day: February 14.
* *Labour Day*: May 1.
* *National Holiday*: May 17.
* *Maundy Thursday*: The Thursday before Easter Sunday.
* *Good Friday*: The Friday before Easter Sunday.
* *Easter Sunday*: Don't ask. It's crazy.
* *Easter Monday*: The day after Easter Sunday.
* *Ascension*: The Thursday which is the 40th day after Easter.
* *Pentecost Sunday*: The Sunday which is the 50th day after Easter.
* *Pentecost Monday*: The Sunday which is the 51st day after Easter.
* Fathersday: Second Sunday in November.
* Christmas Eve: December 24th.
* *Christmas*: December 25th.
* *Boxing Day*: December 26th.

## Easter

The cycle of Easter dates repeats after exactly 5,700,000 years, with April 19 being the most common date.

http://en.wikipedia.org/wiki/Computus

The current implementation simply has a list of 200 years worth of easter.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
