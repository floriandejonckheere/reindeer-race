# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope path: "api", format: false do
    resources :game, controller: :games, only: [:index] do
      member do
        post :user
      end
    end

    resources :leaderbord, controller: :leaderbord, only: [:index]
  end
end

# == Route Map
#
#     Prefix Verb URI Pattern              Controller#Action
#  user_game POST /game/:id/user(.:format) game#user
# game_index GET  /game(.:format)          game#index
