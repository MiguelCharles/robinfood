ActiveAdmin.register Shop do

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
    column :user_id
    column :name_of_the_store
    column :status
    column :category
    column :description
    column :phone_number
    column :VAT_number
    column :created_at
    column :picture_of_the_shop
    column :address
    actions
end
permit_params :user_id, :name_of_the_store, :category, :description, :phone_number, :VAT_number, :created_at, :updated_at, :latitude, :longitude, :zip_code, :city, :country, :address, :picture_of_the_shop, :street_number, :photo_url

end
