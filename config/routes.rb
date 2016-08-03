Rails.application.routes.draw do
  scope '/api' do
    get :food, to: 'foods#index'
  end
end
