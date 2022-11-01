

100.times do |index|
  account = Account.create(email: "test#{index+1}@gmail.com", password: 'testtest')
  Developer.create(
                    first_name: "firstname_#{index+1}",
                    last_name: "lastname_#{index+1}",
                    title: "Ut enim ad minim veniam, quis nostrud exercitation.",
                    account: account,
                    about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    city: $DEVELOPER_COUNTRY_AREAS.shuffle.first,
                    # role_levels: ,
                    # role_types: ,
                    # search_status
                  )
end

