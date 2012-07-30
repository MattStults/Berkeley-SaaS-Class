class CartesianProduct
  include Enumerable
  # your code here
  def initialize left, right
  	@left, @right = left, right
  end
  def each
  	@left.each do |left|
  		@right.each do |right|
  			yield [left, right]
  		end
  	end
  end
end