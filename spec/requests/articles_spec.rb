require "rails_helper"

RSpec.describe ArticlesController do
    describe "#index" do
        it "returns a sucess response" do
            get '/articles'
            expect(response).to have_http_status(:ok) 
        end

        it "returns a proprer JSON" do
            article = create :article
            get '/articles'
            # body = JSON.parse(response.body).deep_symbolize_keys
            expect(json_data.length).to eq(1)
            aggregate_failures do
                expected = json_data.first
                expect(expected[:id]).to eq(article.id.to_s)
                expect(expected[:type]).to eq('articles')
                expect(expected[:attributes]).to eq(
                    title: article.title,
                    content: article.content,
                    slug: article.slug
                ) 
            end
        end
        it 'returns articles in the proper order' do
            older_article = create :article, :created_at => 1.hour.ago 
            recent_article = create :article
            get '/articles'
            ids = json_data.map { |item| item[:id].to_i }
            expect(ids).to(
                eq([recent_article.id, older_article.id])
            )
        end
       
    end 
end