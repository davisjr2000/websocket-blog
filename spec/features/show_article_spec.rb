require 'rails_helper'

RSpec.feature "Showing an Article" do
    
    before do
        @john = User.create(email: 'john@mail.com', password: 'password')
        @greg = User.create(email: 'greg@mail.com', password: 'password')      
        @article = Article.create(title: "Simple Article", body: 'Lorem Ipsum dolor sit amet', user: @john)
    end

    scenario "A owner signed in can see both links" do
        login_as(@john)
        visit "/"
        click_link @article.title

        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page).to have_link("Edit Article")
        expect(page).to have_link("Delete Article")
        expect(current_path).to eq(article_path(@article))
    end

    scenario "A non-owner signed in cannot see both links" do
        login_as(@greg)
        visit "/"
        click_link @article.title

        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
        expect(current_path).to eq(article_path(@article))
    end

    scenario "to a non-signed in user hides Edit/Delete Links" do
        visit "/"
        click_link @article.title

        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
        expect(current_path).to eq(article_path(@article))
    end

end