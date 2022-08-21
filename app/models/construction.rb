class Construction < ApplicationRecord
    paginates_per 5
    has_many :construction_resources, dependent: :destroy
    has_many :managers, dependent: :destroy
    has_many :resources, through: :construction_resources
    has_many :users, through: :managers
    accepts_nested_attributes_for :construction_resources, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :managers, reject_if: :all_blank, allow_destroy: true


    def addQuantity(quantities)
        quantities.each do |resource_id, quantity|
            if quantity != ""
                temp_resource = self.construction_resources.where(resource_id: resource_id.to_i).first
                temp_resource.quantity = quantity.to_i
                temp_resource.save
            end
        end
    end

    def getQuantityId(resource_id)
        if self.construction_resources.where(resource_id: resource_id.to_i).first
            self.construction_resources.where(resource_id: resource_id.to_i).first.quantity
        end
    end

  

end
