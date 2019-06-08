require "generator_spec"

RSpec.describe IsPublished do

  describe IsPublished::Generators::InstallGenerator, type: :generator do

    root_dir = File.expand_path("../../tmp", __FILE__)
    destination root_dir

    before :all do
      prepare_destination
      run_generator
    end

    it "creates the installation db migration" do
      migration_file =
          Dir.glob("#{root_dir}/db/migrate/*create_posts.rb")

      assert_file migration_file[0],
                  /class CreatePosts < ActiveRecord::Migration/
    end

    it "creates the installation model" do
      model_file =
          Dir.glob("#{root_dir}/app/models/post.rb")

      assert_file model_file[0],
                  /class Post < ApplicationRecord/
    end
  end

end