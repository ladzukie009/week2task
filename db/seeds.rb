roles = %w[hr manager]
if User.all.empty?
  roles.each_with_index do |role, i|
    new_user = User.new(
      first_name:             "Jerome",
      last_name:              "Espiritu",
      age:                     24,
      birthdate:              "1993-05-04",
      role:                    role,
      email:                  "testuser#{i}@example.com",
      password:               "password",
      password_confirmation:  "password"
    )

    if new_user.save
      print "#{new_user.first_name} #{new_user.last_name} Succesfully created!\n"
    else
      print new_user.errors.full_messages.to_sentence
    end
  end
else
  print "Skip seeding user table"
end
