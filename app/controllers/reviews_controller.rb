class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: :create

  # GET /reviews or /reviews.json
  def index
    @product = Product.find_by_id(params[:product_id])
    @reviews = Review.where(product_id: params[:product_id])
    @current_user_review = Review.find_by(user_id: current_user.id) unless current_user == nil
  end

  # GET /reviews/1/edit
  def edit
    @product_id = @review.product_id
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to action: :index, product_id: @review.product_id
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    @review.update(review_params)
    product_id = @review.product_id
    redirect_to action: :index, product_id: product_id
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    product_id = @review.product_id
    @review.destroy
    redirect_to action: :index, product_id: product_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :product_id, :rating, :comment)
    end
end
