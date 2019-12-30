require 'rails_helper'

RSpec.feature "Showing an Article" do
    
    before do
        @article = Article.create(title: "First Article", body: 'Lorem Ipsum dolor sit amet')
    end

    scenario "A User goes to article page" do
        visit "/"
        click_link @article.title

        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
    end

end