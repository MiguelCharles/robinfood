ActiveAdmin.register User do

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
form do |f|
    f.inputs "Identity" do
      f.input :username
      f.input :address
      f.input :email
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

index do
    selectable_column
    column :username
    column :address
    column :email
    column :admin
    column :first_name
    column :last_name
    actions
  end

permit_params   :username, :address, :email, :first_name, :last_name, :admin

end
