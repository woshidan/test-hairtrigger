class User < ActiveRecord::Base
  trigger.after(:insert) do
    "same_name_user_count = COUNT(*) FROM users where users.name = NEW.name; IF same_name_user_count > 0 THEN DELETE FROM users WHERE users.id = NEW.id; END IF;"
  end
end
