# frozen_string_literal: true

# typed: false
class LineItemsController < ApplicationController
  extend T::Sig
  before_action :set_line_item, only: %i[show edit update destroy]

  # GET /line_items
  # GET /line_items.json
  sig { void }
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  sig { void }
  def show; end

  # GET /line_items/new
  sig { void }
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  sig { void }
  def edit; end

  # POST /line_items
  # POST /line_items.json
  sig { void }
  def create
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  sig { void }
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  sig { void }
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  sig { void }
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  sig { void }
  def line_item_params
    params.require(:line_item).permit(
      :department,
      :division,
      :dept,
      :department_alias,
      :service_area,
      :service_area_alias,
      :fund, :fund_and_desc,
      :org,
      :org_and_desc,
      :project,
      :project_and_desc,
      :prog,
      :prog_and_desc,
      :account_type,
      :rev_or_exp,
      :acct_and_desc,
      :category,
      :acct
    )
  end
end
