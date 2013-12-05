class GadgetRecipe < ActiveRecord::Base
  belongs_to :gadget 
  belongs_to :recipe
end
