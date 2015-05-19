class User < ActiveRecord::Base
  trigger.before(:insert).where('(SELECT COUNT(*) FROM users where name = NEW.name) > 0') do
    "SET NEW.name = CONCAT(NEW.name, (SELECT COUNT(*) FROM users where name = NEW.name) + 1);"
  end
end
