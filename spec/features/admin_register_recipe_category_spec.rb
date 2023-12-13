require 'rails_helper'

feature 'Admin registra categoria de receita' do
  scenario 'e deve estar logado' do
    visit new_recipe_category_path

    expect(current_path).to eq new_user_session_path
  end

  scenario 'e deve ser admin' do
    user = User.create!(email: 'user@email.com', password: 'senha123', role: :user)

    login_as user, scope: :user
    visit new_recipe_category_path

    expect(current_path).to eq root_path
    expect(page).to have_content 'Você não tem acesso a esse recurso.'
  end

  pending 'com sucesso'
end