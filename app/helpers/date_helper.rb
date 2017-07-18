module DateHelper
  def get_date_from_current_week(day)
    #take user input "day", and exstrapolate current week and date
    @today = Date.today # Today's date
    @dates_from_current_week = (@today.beginning_of_week..@today.end_of_week).map
    
    #loop through each date from the week, and match it was the inputted day
    @dates_from_current_week.each do |date|
      if date.strftime('%^A') === day.upcase
        return date  
      end
    
    end
  end
end