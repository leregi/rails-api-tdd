require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validation' do
  let(:article) { build(:article) }

    it "test an article object" do
      expect(article).to be_valid 
    end

    it "has a valid title" do
      article.title = ""
      expect(article).not_to be_valid 
      expect(article.errors[:title]).to include("can't be blank")
    end
    it "has a valid content" do
      article.content = ""
      expect(article).not_to be_valid 
      expect(article.errors[:content]).to include("can't be blank")
    end
    it "has a valid slug" do
      article.slug = ""
      expect(article).not_to be_valid 
      expect(article.errors[:slug]).to include("can't be blank")
    end
    it "has a unique slug" do
      article.slug = ""
      expect(article).not_to be_valid 
      expect(article.errors[:slug]).to be_unique 
    end
  end
end
