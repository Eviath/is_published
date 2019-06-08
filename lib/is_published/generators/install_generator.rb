require 'rails/generators'
require 'rails/generators/migration'

module IsPublished
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "Add the migrations for IsPublished"
      argument :model_name, type: :string, default: 'post'

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def copy_migrations
        migration_template "create_migration.erb",
                           "db/migrate/create_#{model_name.underscore.pluralize}.rb"
      end

      def create_model
        create_file "app/models/#{model_name.underscore}.rb", "
class #{model_name.capitalize} < ApplicationRecord
  extend IsPublished::Scopes
end
"
      end
    end
  end
end