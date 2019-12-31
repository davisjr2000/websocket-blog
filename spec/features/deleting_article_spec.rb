require 'rails_helper'

RSpec.feature "Deleting an article" do

    before do
        @article = Article.create(title: "Simple Article", body: 'Lorem Ipsum dolor sit amet')
    end

    scenario 'An user deletes an existing article' do
        visit '/'

        click_link @article.title

        click_link 'Delete Article'

        expect(page).to have_content 'Article has been deleted'
        expect(page.current_path).to eq(root_path)
    end
end