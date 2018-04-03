module ApplicationHelper
  
  def formatted_datetime(date)
    date.strftime("%l:%M %p %m/%-d/%y")
  end
  
end
