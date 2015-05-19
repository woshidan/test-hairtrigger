# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerUsersInsert < ActiveRecord::Migration
  def up
    create_trigger("users_after_insert_row_when_select_count_from_users_where_na_tr", :generated => true, :compatibility => 1).
        on("users").
        after(:insert).
        where("(SELECT COUNT(*) FROM users where name = NEW.name) > 0") do
      "DELETE FROM users WHERE id = NEW.id;"
    end
  end

  def down
    drop_trigger("users_after_insert_row_when_select_count_from_users_where_na_tr", "users", :generated => true)
  end
end
