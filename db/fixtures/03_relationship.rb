Relationship.seed do |u|
u.id = 1
u.user_id = 1
u.follow_id = 3
end

Relationship.seed do |u|
u.id = 2
u.user_id = 2
u.follow_id = 1
end

Relationship.seed do |u|
u.id = 3
u.user_id = 3
u.follow_id = 1
end

Relationship.seed do |u|
u.id = 4
u.user_id = 1
u.follow_id = 4
end
