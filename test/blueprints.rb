require 'MongoMapper'
require 'sham'

Sham.user { Faker::Name.name }
Sham.sessionid { (1..10).map { ('a'..'z').to_a.rand }.join }
Sham.x { (1..100).to_a.rand }
Sham.y { (1..100).to_a.rand }
Sham.chapterid { (1..10).to_a.rand }

Session.blueprint do
    sessionid { Sham.sessionid }
    user { Sham.user }
end

Session.make