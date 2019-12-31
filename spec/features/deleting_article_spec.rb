require 'rails_helper'

RSpec.feature "Deleting an article" do

    before do
        john = User.create(email: 'john@mail.com', password: 'password')
        login_as(john)
        @article = Article.create(title: "Simple Article", body: 'Lorem Ipsum dolor sit amet', user: john)
    end

    scenario 'An user deletes an existing article' do
        visit '/'

        click_link @article.title

        click_link 'Delete Article'

        expect(page).to have_content 'Article has been deleted'
        expect(page.current_path).to eq(root_path)
    end
end