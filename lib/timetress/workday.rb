module Timetress
  module Workday
    def workday?(date)
      !day_off?(date)
    end

    def day_off?(date)
      [0, 6].include?(date.wday) || official_holidays(date.year).include?(date)
    end

    def nth_workday_after(n, date)
      target = date + n
      target += 1 until workday?(target)
      target
    end

    def nth_workday_before(n, date)
      target = date - n
      target -= 1 until workday?(target)
      target
    end
  end
end
