require 'rails_helper'

RSpec.feature 'User adds a comment to an article' do

    before do
        @john = User.create(email: 'john@mail.com', password: 'password')
        @fred = User.create(email: "fred@example.com", password: "password")
        @article = Article.create(title: "Artigo 1", body: "I'm an article!!!", user: @john)
    end

    scenario 'A User creates a new comment' do

        login_as(@fred)

        visit '/'

        click_link @article.title

        fill_in "New Comment", with: "An awesome article" 

        click_button "Add Comment"

        expect(page).to have_content("Comment has been created") 
        expect(page).to have_content("An awesome article") 
        expect(current_path).to eq(article_path(@article.id))  
    end
    
end