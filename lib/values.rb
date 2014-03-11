class Value
  def initialize(value)
    @value = value
  end

  def value
    @value
  end

  def change_value(new_value)
    @value = new_value
  end
end

class Phone < Value
  def initialize(value, label)
    @value = value
    @label = label
  end

  def label
    @label
  end

  def change_label(new_label)
    @label = new_label
  end
end

class Email < Value
end

class Address < Value
  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def change_value(new_street, new_city, new_state, new_zip)
    @street = new_street
    @city = new_city
    @state = new_state
    @zip = new_zip
  end

  def full_address
    "#{@street}, #{@city} #{@state}, #{@zip}"
  end

  def street
    @street
  end

  def city
    @city
  end

  def state
    @state
  end

  def zip
    @zip
  end
end




