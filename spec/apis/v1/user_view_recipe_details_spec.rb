require 'rails_helper'

describe 'Usuário vê detalhes de receita' do
  context 'GET /api/v1/recipes/:id' do
    it 'com sucesso' do
      User.create!()
    end
  
    pending 'mas receita não existe'
  
    pending 'com erro interno'
  end
end
