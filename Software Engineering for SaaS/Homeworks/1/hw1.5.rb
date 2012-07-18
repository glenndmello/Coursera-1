class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s        # make sure it's a string
    attr_reader attr_name             # create the attribute's getter
    attr_reader attr_name+"_history"  # create bar_history getter
    class_eval %Q{
                   def #{attr_name}=(value)
                     @#{attr_name}_history ||= [nil]
                     @#{attr_name}_history << value
                     @#{attr_name} = value
                   end
                 }
  end
end


class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id, *arguments)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    elsif method_id.to_s == "in"
      singular_currency = arguments.first.to_s.gsub(/s$/, '')
      self / @@currencies[singular_currency]
    else
      super
    end
  end
end


class String
  def palindrome?
    self.downcase.gsub(/\W/, '') == self.downcase().gsub(/\W/, '').reverse
  end
end


module Enumerable
  def palindrome?
    self.collect{ |x| x } == self.reverse_each.collect{ |x| x }
  end
end
