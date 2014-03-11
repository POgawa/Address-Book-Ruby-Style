require './lib/contact'
# require './lib/address_book'

def main_menu
  puts "Press 'a' to add a contact or 'l' to list all of your contact."
  puts "Press 'x' in any menu to exit."
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_contact
  when 'l'
    list_contact
  when 'x'
    puts "Good-bye!"
  else
    puts "Sorry, that wasn't a valid option."
    main_menu
  end
end

def add_contact
  puts "First name:"
  first_name = gets.chomp
  puts "Last name:"
  last_name = gets.chomp
  Contact.create(first_name, last_name)
  puts "#{first_name} #{last_name} added.\n\n"
  list_contact
end

def list_contact
  puts "\nHere are all of your contacts:"
  Contact.all.each_with_index do |contact, index|
    puts "#{index+1} #{contact.name}"
  end
  puts "\n"
  puts "Enter a contact's number to view that contact, 'd' to delete a contact, or 'a' to add a contact."
  puts "Enter 'x' to exit."
  list_choice = gets.chomp
  case list_choice
  when 'm'
    main_menu
  when 'a'
    add_contact
  when 'd'
    puts "What is the number of the contact you would like to delete?"
    contact_index = gets.chomp.to_i - 1
    Contact.all.delete_at(contact_index)
    list_contact
  when /\d/
    show_contact(list_choice.to_i - 1)
  when 'x'
    "Goodbye"
  else
    "Invalid choice, please re-enter."
    list_contact
  end
end

def show_contact(contact_index)
  current_contact = Contact.all[contact_index]
  puts "\nName:\t#{current_contact.name}"

  current_contact.phones.each do |phone|
    puts "Phone:\t\t#{phone.number}"
  end
  current_contact.emails.each do |email|
    puts "Email:\t\t#{email.email}"
  end
  current_contact.addresses.each do |address|
    puts "Address:\t#{address.address}"
  end

  puts "\n\nEnter 'e' to edit your contact, 'l' to return to the contact list\nEnter 'x' to exit the program."
  case edit_address = gets.chomp
  when 'e'
    edit_contact(contact_index)
  when 'l'
    list_contact
  when 'm'
    main_menu
  when 'x'
    puts "Good-bye"
  else
    "Invalid input, please try again."
    show_contact(contact_index)
  end
end

def edit_contact(contact_index)
  current_contact = Contact.all[contact_index]
  puts "What would you like to change? Enter 'p' to change phone, 'e' to change email and 'a' to change address\nEnter 'l' to return to the list of contacts or 'x' to exit the program."
  case edit_address = gets.chomp
  when 'p'
    edit_phones(contact_index)
  when 'e'
    edit_emails(contact_index)
  when 'a'
    edit_addresses(contact_index)
  when 'l'
    list_contact
  when 'm'
    main_menu
  when 'x'
    puts "Goodbye."
  else
    "Invalid choice, please re-enter"
    edit_contact(contact_index)
  end
end

def edit_phones(contact_index)
  puts "\nHere are all of #{Contact.all[contact_index].name}'s phone numbers:"
  Contact.all[contact_index].phones.each_with_index do |phone, index|
    puts "#{index+1} #{phone.number}"
  end
  if Contact.all[contact_index].phones.length == 0
    puts "[no phone numbers yet]"
  end
  puts "\nEnter a contact's number to edit that phone number, enter 'n' to add new phone\nEnter 'l' to return to the contact list, or 'x' to exit the program."
  list_choice = gets.chomp
  case list_choice
  when 'n'
    puts "Enter new phone number:"
    new_phone = gets.chomp
    Contact.all[contact_index].add_phone(new_phone)
    edit_phones(contact_index)
  when /\d/
    puts "Enter edited phone number for #{Contact.all[contact_index].phones[list_choice.to_i - 1].number}:"
    new_phone = gets.chomp
    Contact.all[contact_index].phones[list_choice.to_i - 1].change_phones(new_phone)
    edit_phones(contact_index)
  when 'l'
    list_contact
  when 'm'
    main_menu
  when 'x'
    puts "Goodbye"
  else
    "Invalid choice, please try again."
    edit_phones(contact_index)
  end
end

def edit_emails(contact_index)
  puts "\nHere are all of #{Contact.all[contact_index].name}'s emails:"
  Contact.all[contact_index].emails.each_with_index do |email, index|
    puts "#{index+1} #{email.email}"
  end
  if Contact.all[contact_index].emails.length == 0
    puts "[no emails yet]"
  end
  puts "\nEnter a contact's emails number to edit that email address, enter 'n' to add new email address.\nEnter 'l' to return to the contact list, or 'x' to exit the program."
  list_choice = gets.chomp
  case list_choice
  when 'n'
    puts "Enter new email:"
    new_email = gets.chomp
    Contact.all[contact_index].add_email(new_email)
    edit_emails(contact_index)
  when /\d/
    puts "Enter edited email for #{Contact.all[contact_index].emails[list_choice.to_i - 1].email}:"
    new_email = gets.chomp
    Contact.all[contact_index].emails[list_choice.to_i - 1].change_email(new_email)
    edit_emails(contact_index)
  when 'l'
    list_contact
  when 'm'
    main_menu
  when 'x'
    puts "Goodbye"
  else
    "Invalid choice, please try again."
    edit_emails(contact_index)
  end
end

def edit_addresses(contact_index)
  puts "\nHere are all of #{Contact.all[contact_index].name}'s addresses:"
  Contact.all[contact_index].addresses.each_with_index do |address, index|
    puts "#{index+1} #{address.address}"
  end
  if Contact.all[contact_index].addresses.length == 0
    puts "[no addresses yet]"
  end
  puts "\nEnter an address's number to edit that email address, or enter 'n' to add new address.\nEnter 'l' to return to the contact list, or 'x' to exit the program."
  list_choice = gets.chomp
  case list_choice
  when 'n'
    puts "Enter new address:"
    new_address = gets.chomp
    Contact.all[contact_index].add_address(new_address)
    edit_addresses(contact_index)
  when /\d/
    puts "Enter edited address for #{Contact.all[contact_index].addresses[list_choice.to_i - 1].address}:"
    new_address = gets.chomp
    Contact.all[contact_index].addresses[list_choice.to_i - 1].change_address(new_address)
    edit_addresses(contact_index)
  when 'l'
    list_contact
  when 'm'
    main_menu
  when 'x'
    puts "Goodbye"
  else
    "Invalid choice, please try again."
    edit_addresses(contact_index)
  end
end

main_menu
