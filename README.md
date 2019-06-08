# IsPublished

Simple RubyGem which adds scope .published to any rails model you want!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'is_published'
```

And then execute:

    $ bundle

Or install it manually on local machine

    $ gem install is_published

## Usage
Before all, class you want to extend with this gem, needs to have column 'published' in the database.

If your model table already exists, you can create migration to add published column like this:

```ruby
rails g migration AddPublishedColumnToPosts published:boolean
```

Generated migration should now look like this:
```ruby
class AddPublishedColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :published, :boolean, default: false
  end
end
```
Default value of 'published' should be 'false', rails generator doesnt allow that in generator command, you have to edit migration by yourself.

When database is ready, you can start with gem setup.
***

Add code below to any Ruby class to add scope .where(published: true) 

```ruby
class Post < ApplicationRecord
  # Here you extend your class with gem
  extend IsPublished::Scopes
end
```

Then you can use it like every other scope 

```ruby
Post.published 
#=>  => #<Post id: 1, title: "Published post", user_id: 1, published: true, created_at: "2019-06-07 14:42:22", updated_at: "2019-06-07 16:51:07">

Post.find(1).published?
#=> true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Eviath/is_published. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IsPublished project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/is_published/blob/master/CODE_OF_CONDUCT.md).
