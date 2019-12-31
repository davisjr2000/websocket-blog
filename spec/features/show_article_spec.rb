require 'rails_helper'

RSpec.feature "Showing an Article" do
    
    before do
        john = User.create(email: 'john@mail.com', password: 'password')
        login_as(john)
        @article = Article.create(title: "Simple Article", body: 'Lorem Ipsum dolor sit amet', user: john)
    end

    scenario "A User goes to article page" do
        visit "/"
        click_link @article.title

        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
    end

end