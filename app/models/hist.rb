class Hist < ActiveRecord::Base
  attr_accessible :date, :source_id, :count

  def self.pivot

      from = Date.today - 7
      to = Date.today
      pivot_conditions = (from..to).map { |i| "sum(if(date = '#{i}', count, '')) as `#{i}`" }

      str_sql = "SELECT `source_id`, #{pivot_conditions.join(', ')}
          FROM hists
          GROUP BY `source_id`"

      find_by_sql(str_sql)

  end

end
