require "rails_helper"

RSpec.feature "Deleting an Articles" do
  before do
    john = User.create! email: "john@example.com", password: "password"
    login_as(john)
    @article = Article.create! title: "The first article", user: john, 
                               body: "Lorem ipsum dolor sit, amet, consectetur" 
  end

  scenario "A user deletes an article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end