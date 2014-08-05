module Timetress
  module USA
    module Holiday
      include Timetress::Holiday

      def mothersday(year)
        second_sunday_in(MAY, year)
      end

      def labour_day(year)
        first_monday_in(SEPTEMBER, year)
      end
      alias_method :labor_day, :labour_day

      def independence_day(year)
        Date.new(year, 7, 4)
      end
      alias_method :national_holiday, :independence_day

      def memorial_day(year)
        last_monday_in(MAY, year)
      end

      def fathersday(year)
        third_sunday_in(JUNE, year)
      end

      def martin_luther_king_day(year)
        third_monday_in(JANUARY, year)
      end

    end
  end
end

