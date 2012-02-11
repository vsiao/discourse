class Message < ActiveRecord::Base
  attr_accessible :content
  
  def self.convert_to_latex(string)
    latex = ""
    string.split("$").each_with_index do |x, i|
      if (i % 2) == 0
        latex += x
      else
        latex += '<img src="http://latex.codecogs.com/svg.latex?' + x.gsub(/ /,'%20') + '" />'
      end
    end
    
    return latex
  end
end
