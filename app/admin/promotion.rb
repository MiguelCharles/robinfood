ActiveAdmin.register Promotion do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
    selectable_column
    column :shop_id
    column :title
    column :product_type
    column :initial_quantity
    column :unit
    column :initial_price_per_unit
    column :price_after_promotion_per_unit
    column :remaining_quantity
    column :promotion_status
    column :digits_code
    column :validity
    column :created_at
    column :photo_url
    actions
  end

permit_params :shop_id, :title, :product_type, :initial_quantity, :unit, :initial_price_per_unit, :price_after_promotion_per_unit,:remaining_quantity, :promotion_status, :digits_code, :validity, :created_at, :updated_at, :min_quantity, :description, :photo_url

end
