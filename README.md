# Timetress

Knows about workdays and holidays, public and otherwise.
Answers the age-old question _When is mothersday this year?_.

[![Build Status](https://secure.travis-ci.org/kytrinyx/timetress.png?branch=master)](http://travis-ci.org/kytrinyx/timetress)

## Installation

Add this line to your application's Gemfile:

```bash
gem 'timetress'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install timetress
```

## Usage

### Timetress knows about holidays

```ruby
Timetress.christmas 2012
=> #<Date: 2012-12-25>
```

```ruby
# On New Year's Eve, 2011
Timetress.next_christmas
=> #<Date: 2012-12-25>
```

```ruby
# On Christmas Day, 2012
Timetress.previous_christmas
=> #<Date: 2011-12-25>
```

### Public Holidays (Norway & Scotland only)

> A public holiday, national holiday or legal holiday is a holiday generally established by law and is usually a non-working day during the year.
> - Wikipedia

```ruby
Timetress::Norway.public_holidays(2012)
=> [#<Date: 2012-01-01>, #<Date: 2012-04-05>,...]
```

```ruby
Timetress::Scotland.public_holidays(2012)
=> [#<Date: 2012-01-02>, #<Date: 2012-01-03>,...]
```


### Workdays

A workday is a day of the week which is neither a weekend, nor a public holiday.

```
Timetress::Norway.workday? Date.new(2012, 1, 5)
 => true

Timetress::Norway.workday? Date.new(2012, 5, 17)
 => false

Timetress::Scotland.workday? Date.new(2012, 1, 2)
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

## Implemented holidays (Scotland)

> **Bank holidays** are holidays when banks and many other businesses are closed for the day. **Public holidays** are holidays which have been observed through custom and practice.
> - [Wikipedia](http://en.wikipedia.org/wiki/Public_holidays_in_the_United_Kingdom)

### Bank holidays and royal proclamations

In Scotland, bank holidays always extend the weekend. This is done via a royal proclamation.

>Royal proclamation is used to move bank holidays that would otherwise fall on a weekend. In this way, public holidays are not 'lost' in years when they coincide with weekends. 
> - [Wikipedia](http://en.wikipedia.org/wiki/Bank_holiday#Royal_proclamation)

Essentially, if a holiday lands on a weekend, there is a royal proclamation "moving" the day everybody gets off work to the next weekday. I.e. if New Year's Days is on a Sunday, everybody gets Monday off.


### Bank Holidays

* **New Year's Day:** January 1st
* **New Year's Holiday:** January 2nd
* **Good Friday:** The Friday before Easter Sunday
* **May Day:** First Monday in May
* **Spring Holiday/Victoria Day:** The last Monday in May
* **Summer Holiday:** First Monday in August
* **St. Andrew's Day:** November 30th / royal proclamation
* **Christmas Day:** December 25th / royal proclamation
* **Boxing Day:** December 26th / royal proclamation

### Public Holidays

All of the bank holidays (without royal proclamation) plus:

* **Mother's Day:** Fourth Sunday in Lent
* **Father's Day:** Third Sunday in June



## Easter

The cycle of Easter dates repeats after exactly 5,700,000 years, with April 19 being the most common date.

http://en.wikipedia.org/wiki/Computus

The current implementation simply has a list of 200 years worth of easter.

## Contributing

There are numerous holidays that did not make it onto the list in the first pass, mostly because I don't know about them. I had to look all but New Year's Eve up on Wikipedia.

Please do add missing holidays, as well as modules for other countries.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
