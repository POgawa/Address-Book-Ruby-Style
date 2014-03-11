require './lib/phones'
require './lib/emails'
require './lib/addresses'

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

  def add_phone(phone_number)
    new_phone = Phones.new(phone_number)
    @phones << new_phone

  end

  def phones
    @phones
  end

  def add_email(email_address)
    new_email = Emails.new(email_address)
    @emails << new_email
  end

  def emails
    @emails
  end

  def add_address(entered_address)
    new_address = Addresses.new(entered_address)
    @addresses << new_address
  end

  def addresses
    @addresses
  end

end
