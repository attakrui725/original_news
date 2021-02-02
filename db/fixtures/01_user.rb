User.seed do |u|
u.id = 1
u.name = 'haru'
u.encrypted_password = '111aaa'
u.email = 'a@gmail.com'
end

User.seed do |u|
u.id = 2
u.name = 'natu'
u.encrypted_password = '222bbb'
u.email = 'b@gmail.com'
end

User.seed do |u|
u.id = 3
u.name = 'aki'
u.encrypted_password = '333ccc'
u.email = 'c@gmail.com'
end

User.seed do |u|
u.id = 4
u.name = 'huyu'
u.encrypted_password = '444ddd'
u.email = 'd@gmail.com'
end
