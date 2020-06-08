# frozen_string_literal: true

# typed: strict
Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :line_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
