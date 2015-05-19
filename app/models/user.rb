class User < ActiveRecord::Base
  trigger.after(:insert).where('(SELECT COUNT(*) FROM users where name = NEW.name) > 0') do
    "DELETE FROM users WHERE id = NEW.id;"
  end
end
