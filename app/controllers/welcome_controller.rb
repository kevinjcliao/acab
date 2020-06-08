# frozen_string_literal: true

# typed: strict
class WelcomeController < ApplicationController
  extend T::Sig

  sig { void }
  def index
    @funding_counts = T.let(
      LineItem.funding_by_department,
      T.nilable(T::Hash[String, Integer])
    )
    respond_to do |format|
      format.html
      format.json { render json: @funding_counts }
    end
  end
end
