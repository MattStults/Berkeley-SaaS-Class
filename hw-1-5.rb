class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string 
    attr_reader attr_name # create the attribute's getter 
    attr_reader attr_name+"_history" # create bar_history getter 
    class_eval %Q{
    	def #{attr_name}=(val)
    		@#{attr_name}_history = [nil] if #{attr_name}_history == nil
    		@#{attr_name}_history += [val]
    	end
    }
  end 
end

#a
class Numeric
  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def self.currency_conversion(currency)
  	singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      @@currencies[singular_currency]
	else
		nil
  	end
  end
  def method_missing(method_id)
  	conversion = Numeric.currency_conversion method_id
  	if(conversion != nil)
  		self * conversion
  	else
  		super
  	end
  end
  def in(method_id)
  	conversion_out = Numeric.currency_conversion method_id
  	self * (1/conversion_out)
  end
end

#b
class String
	def palindrome?
		temp = self.gsub(/\W+/, "")
		temp.downcase!
		temp == temp.reverse
	end
end

#c
module Enumerable
	def palindrome?
		array = self.collect { |x| x }
		array == array.reverse
	end
end