RSpec.describe IsPublished do
  it "has a version number" do
    expect(IsPublished::VERSION).not_to be nil
  end


  before :each do
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: ':memory'
    )
    ActiveRecord::Schema.define do
      create_table :posts, force: true do |t|
        t.boolean :published, default: false
      end
    end
  end

  describe '.published' do
    before :each do
      class Post < ActiveRecord::Base
        extend IsPublished::Scopes
      end
    end

    it 'returns records where published: true' do
      post1 = Post.create
      post2 = Post.create(published: true)

      posts = Post.published

      expect(posts.size).to eq(1)
      expect(posts).to include(post2)
      expect(Post.published.to_a).to_not include(post1)
    end
  end

end
