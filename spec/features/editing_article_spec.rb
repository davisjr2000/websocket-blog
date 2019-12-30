require 'rails_helper'

RSpec.feature 'Editing an existing article' do

    before do
        @article = Article.create(title: "Simple Article", body: 'Lorem Ipsum dolor sit amet')
    end

    scenario 'A User edits an existing article' do
        visit '/'
        
        click_link @article.title

        click_link 'Edit Article'
        
        fill_in 'Title', with: 'Updated Article'
        fill_in 'Body', with: 'Updated Lorem Ipsum'

        click_button 'Update Article'

        expect(page).to have_content("Article has been updated")
        expect(page).to have_content("Updated Article")
        expect(page.current_path).to eq(article_path(@article))
    end

    scenario 'A User fails to update an article' do
        visit '/'
        
        click_link @article.title

        click_link 'Edit Article'
        
        fill_in 'Title', with: ''
        fill_in 'Body', with: ''

        click_button 'Update Article'

        expect(page).to have_content("Article has not been updated")   
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Body can't be blank")
    end
end