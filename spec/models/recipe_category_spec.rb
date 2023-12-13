require 'rails_helper'

RSpec.describe RecipeCategory, type: :model do
  context '#valid?' do
    it 'inválido quando nome é vazio' do
      category = RecipeCategory.new(name: '')

      category.valid?

      expect(category.errors.include? :name).to be true
    end
  end
end
