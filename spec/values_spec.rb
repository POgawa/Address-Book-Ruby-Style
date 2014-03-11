require 'rspec'
require 'values'

describe Phone do
  describe '.create' do
    it 'creates a phone number' do
      test_phone = Phone.new("2313424", "")
      test_phone.should be_an_instance_of Phone
    end
  end
  describe '.label' do
    it 'returns what the label of the phone is' do
      test_phone = Phone.new("2313424", "")
      test_phone.label.should eq ""
    end
  end
  describe '.change_label' do
    it 'changes the label of the phone' do
      test_phone = Phone.new("123456", "")
      test_phone.change_label("change")
      test_phone.label.should eq "change"
    end
  end
end


describe Address do
  describe '.create' do
    it 'creates a new address' do
      test_address = Address.new("123 main street", "Portland", "Oregon", "97201")
      test_address.should be_an_instance_of Address
    end
  end
  describe 'Address' do
    it 'returns the street address' do
      test_address = Address.new("123 main street", "Portland", "Oregon", "97201")
      test_address.street.should eq "123 main street"
    end
    it 'returns the city' do
      test_address = Address.new("123 main street", "Portland", "Oregon", "97201")
      test_address.city.should eq "Portland"
    end
    it 'returns the state' do
      test_address = Address.new("123 main street", "Portland", "Oregon", "97201")
      test_address.state.should eq "Oregon"
    end
    it 'returns the zip code' do
      test_address = Address.new("123 main street", "Portland", "Oregon", "97201")
      test_address.zip.should eq "97201"
    end
    it 'returns the full address' do
      test_address = Address.new("123 main street", "Portland", "OR", "97201")
      test_address.full_address.should eq "123 main street, Portland OR, 97201"
    end
  end
end



