# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope path: "api", format: false do
    resources :game, controller: :games, only: [:index, :show] do
      resources :user, controller: :users, only: [:create] do
        resources :dash, controller: :dash, only: [:create]
      end

      resources :score, controller: :scores, only: [:index]
    end

    resources :leaderbord, controller: :leaderbord, only: [:index]
  end
end

# == Route Map
#
#           Prefix Verb URI Pattern        Controller#Action
#        user_game POST /api/game/:id/user games#user
#       game_index GET  /api/game          games#index
#             game GET  /api/game/:id      games#show
# leaderbord_index GET  /api/leaderbord    leaderbord#index
