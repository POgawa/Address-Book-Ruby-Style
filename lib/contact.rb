require './lib/values'

class Contact
  @@all_contacts = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @phones = []
    @emails = []
    @addresses = []
  end

  def Contact.create(first_name, last_name)
    new_contact = Contact.new(first_name, last_name)
    new_contact.save
    new_contact
  end

  def save
    @@all_contacts << self
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def Contact.clear
    @@all_contacts = []
  end

  def Contact.all
    @@all_contacts
  end

  def add_phone(phone_number, label)
    new_phone = Phone.new(phone_number, label)
    @phones << new_phone

  end

  def phones
    @phones
  end

  def add_email(email_address)
    new_email = Email.new(email_address)
    @emails << new_email
  end

  def emails
    @emails
  end

  def add_address(entered_street, entered_city, entered_state, entered_zip)
    new_address = Address.new(entered_street, entered_city, entered_state, entered_zip)
    @addresses << new_address
  end

  def addresses
    @addresses
  end

end
