require 'rspec'
require 'address_book'
require 'contact'


describe Address_book do
  describe 'create address book' do
    it 'creates an instance of an address book' do
      test_book = Address_book.new('wash the lion')
      test_book.should be_an_instance_of Address_book
    end
  end
end

describe Contact do
  before do
    Contact.clear
  end

  describe '.clear' do
    it 'empties out all the saved contacts' do
      Contact.new('Jan', 'Ullrich')
      Contact.clear
      Contact.all.should eq []
    end
  end

  describe '.create' do
    it 'creates an instance of the contact class' do
      test_contact = Contact.create('Marco', 'Pantani')
      test_contact.should be_an_instance_of Contact
    end
  end

  describe 'initialize contact' do
    it 'creates contact and adds to contacts array' do
      test_contact = Contact.create('Marco', 'Pantani')
      Contact.all.should eq [test_contact]
    end
  end

  describe 'add_phone' do
    it 'adds a phone number for a Contact' do
      test_contact = Contact.create('Jan', 'Ullrich')
      test_contact.add_phone("829-267-2859", "")
      test_contact.phones[0].value.should eq "829-267-2859"
    end
  end

  describe 'add_email' do
    it 'adds an email to the Contact' do
      test_contact = Contact.create('Jan', 'Ullrich')
      test_contact.add_email('jan.ullrich@tmobile.com')
      test_contact.emails[0].value.should eq 'jan.ullrich@tmobile.com'
    end
  end

  describe 'add_address' do
    it 'adds an address to the Contact' do
      test_contact = Contact.create('Jan', 'Ullrich')
      test_contact.add_address("No. 2 Jan Ullrich Way", "Hamburg", "OH", "43456")
      test_contact.addresses[0].full_address.should eq "No. 2 Jan Ullrich Way, Hamburg OH, 43456"
    end
  end
end





