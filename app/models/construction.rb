class Construction < ApplicationRecord
    has_many :construction_resources, dependent: :destroy
    has_many :resources, through: :construction_resources
    accepts_nested_attributes_for :construction_resources, reject_if: :all_blank, allow_destroy: true

    def addQuantity(quantities)
        quantities.each do |resource_id, quantity|
            if quantity != ""
                temp_resource = self.construction_resources.where(resource_id: resource_id.to_i).first
                if quantity.nil?
                    temp_resource.quantity = ""
                    temp_resource.save
                else
                    temp_resource.quantity = quantity.to_i
                    temp_resource.save
                end 
                
            end
        end
    end

    def getQuantityId(resource_id)
        if self.construction_resources.where(resource_id: resource_id.to_i).first
            self.construction_resources.where(resource_id: resource_id.to_i).first.quantity
        end
    end


end
