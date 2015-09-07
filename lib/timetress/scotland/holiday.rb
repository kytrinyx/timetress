module Timetress
  module Scotland
    module Holiday
      include Timetress::Holiday

      VALID_ORDINALS = %w(first second third forth last)
      VALID_DAY_NAMES = %w(
        Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

      def new_year_holiday(year)
        Date.new(year, JANUARY, 2)
      end

      def may_day(year)
        first_monday_in(MAY, year)
      end
      alias_method :labour_day, :may_day
      alias_method :early_may_bank_holiday, :may_day

      def spring_holiday(year)
        if year == 2012
          # Special case for the Queen's Diamond Jubilee
          Date.new(2012, 6, 4)
        else
          last_monday_in(MAY, year)
        end
      end
      alias_method :victoria_day, :spring_holiday

      def summer_holiday(year)
        first_monday_in(AUGUST, year)
      end

      def st_andrews_day(year)
        Date.new(year, NOVEMBER, 30)
      end

      def ash_wednesday(year)
        easter_sunday(year) - 46
      end

      def mothersday(year)
        # 4 days to the 1st Sunday + 3 more weeks = 25 days
        ash_wednesday(year) + 25
      end
      alias_method :mothering_day, :mothersday

      def fathersday(year)
        third_sunday_in(JUNE, year)
      end

      # http://en.wikipedia.org/wiki/Public_holidays_in_the_United_Kingdom#Scotland
      def official_holidays(year)
        [
          new_years_day(year),
          new_year_holiday(year),
          good_friday(year),
          easter_monday(year),
          may_day(year),
          mothersday(year),
          fathersday(year),
          spring_holiday(year),
          summer_holiday(year),
          st_andrews_day(year),
          christmas(year),
          boxing_day(year)
        ].uniq.sort
      end
      alias_method :public_holidays, :official_holidays

      # http://www.scotland.gov.uk/Topics/People/bank-holidays/
      def bank_holidays(year)
        [
          new_years_day(year),
          new_year_holiday(year),
          good_friday(year),
          early_may_bank_holiday(year),
          spring_holiday(year),
          summer_holiday(year),
          st_andrews_day(year),
          christmas(year),
          boxing_day(year)
        ].uniq.sort.map { |d| royal_proclamation(d) }
      end

      def royal_proclamation(holiday)
        # Scotland has two two-day holidays. We use these below.
        special_2nd_day_holidays = [
          boxing_day(holiday.year),
          new_year_holiday(holiday.year)
        ]

        if holiday.sunday?
          # If the second day of a two day holiday falls on a Sunday,
          # then the Monday & Tuesday become bank holidays.
          if special_2nd_day_holidays.include? holiday
            holiday + 2
          else
            holiday + 1
          end
        elsif holiday.saturday?
          holiday + 2
        else
          # If the second day of a two day holiday is on a Monday
          # then it gets the Monday and the second day gets the
          # Tuesday.
          if holiday.monday? &&
             special_2nd_day_holidays.include?(holiday)
            holiday + 1
          else
            holiday
          end
        end
      end

      private

      def days_until(day, date)
        x = 0
        # utilize the monday?, tuesday?, etc. methods on the Date object
        until date.send("#{day}?")
          date += 1
          x += 1
        end
        x
      end

      # Catch methods like "first_monday_in" or "third_tuesday_in"
      def method_missing(method_id, *args)
        month, year = args

        valid_regex = /(#{VALID_ORDINALS.join('|')})\_(#{VALID_DAY_NAMES.join('|')})\_in/
        valid_method = valid_regex.match method_id

        if valid_method.nil?
          super
        else
          week = case valid_method[1]
            when 'first' then Date.new(year, month, 1)
            when 'second' then Date.new(year, month, 8)
            when 'third' then Date.new(year, month, 15)
            when 'last' || 'fourth' then Date.new(year, month, -7)
          end
          week + days_until(valid_method[2], week)
        end
      end
    end
  end
end
