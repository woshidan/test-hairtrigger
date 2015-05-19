# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerUsersInsert < ActiveRecord::Migration
  def up
    drop_trigger("users_before_insert_row_when_select_count_from_users_where_n_tr", "users", :generated => true)

    create_trigger("users_before_insert_row_when_select_count_from_users_where_n_tr", :generated => true, :compatibility => 1).
        on("users").
        before(:insert).
        where("(SELECT COUNT(*) FROM users where name = NEW.name) > 0") do
      "SET NEW.name = CONCAT(NEW.name, (SELECT COUNT(*) FROM users where name = NEW.name) + 1);"
    end
  end

  def down
    drop_trigger("users_before_insert_row_when_select_count_from_users_where_n_tr", "users", :generated => true)

    create_trigger("users_before_insert_row_when_select_count_from_users_where_n_tr", :generated => true, :compatibility => 1).
        on("users").
        before(:insert).
        where("(SELECT COUNT(*) FROM users where name = NEW.name) > 0") do
      "SET NEW.name = CONCAT(NEW.name, date_format(now(), '%Y年%m月%d日 %h時%i分%s秒'));"
    end
  end
end
