class RatingsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.rating.create(rating_params)
    @ratings = Rating.where(product_id: @product.id)
    counter = 0
    rating = 0
    @ratings.each do |r|
      counter += 1
      rating += r.value
    end
    rating = rating / counter
    @product.update(p_rating: rating)

    redirect_to product_path(@product)

  end

  def rating_params
    params.require(:rating).permit(:value)
  end

end
