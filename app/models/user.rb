class User < ActiveRecord::Base
  trigger.before(:insert) do
    "same_name_user_count = COUNT(*) FROM users where users.name = NEW.name; IF same_name_user_count = 0 THEN INSERT INTO users (id, name) VALUES (NEW.id, NEW.name); END IF;"
  end
end
