require 'rails_helper'

describe 'Usuário vê detalhes de receita', type: :request do
  context 'GET /api/v1/recipes/:id' do
    it 'com sucesso' do
      user = User.create!(email: 'user@email.com', password: 'senha123')
      recipe_type = RecipeType.create!(name: 'Sobremesa')
      recipe = Recipe.create!(title: 'Brigadeiro', cook_time: 30, ingredients: 'Leite condensado, chocolate em pó e manteiga', instructions: 'Misture tudo, leve ao fogo e mexa até começar a soltar da panela. Desligue e espere esfriar.', recipe_type: recipe_type, user: user)

      get "/api/v1/recipes/#{recipe.id}"
      response_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response_json['recipe']['title']).to eq 'Brigadeiro'
      expect(response_json['recipe']['ingredients']).to eq 'Leite condensado, chocolate em pó e manteiga'
      expect(response_json['recipe']['instructions']).to eq 'Misture tudo, leve ao fogo e mexa até começar a soltar da panela. Desligue e espere esfriar.'
      expect(response_json['recipe']['cook_time']).to eq 30
      expect(response_json['user']['email']).to eq 'user@email.com'
    end
  
    it 'mas receita não existe' do
      get '/api/v1/recipes/1'
      response_json = JSON.parse(response.body)

      expect(response.status).to eq 404
      expect(response_json['message']).to eq 'Recurso não encontrado.'
    end
  
    it 'com erro interno' do
      user = User.create!(email: 'user@email.com', password: 'senha123')
      recipe_type = RecipeType.create!(name: 'Sobremesa')
      recipe = Recipe.create!(title: 'Brigadeiro', cook_time: 30, ingredients: 'Leite condensado, chocolate em pó e manteiga', instructions: 'Misture tudo, leve ao fogo e mexa até começar a soltar da panela. Desligue e espere esfriar.', recipe_type: recipe_type, user: user)

      allow(Recipe).to receive(:find).and_raise(ActiveRecord::QueryCanceled)

      get "/api/v1/recipes/#{recipe.id}"
      response_json = JSON.parse(response.body) 

      expect(response.status).to eq 500
      expect(response_json['message']).to eq 'Erro interno no servidor.'
    end
  end
end
