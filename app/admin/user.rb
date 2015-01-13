ActiveAdmin.register User do

index :as => :grid, :default => true do |user|
    link_to(image_tag(user.image_url(:detail)), admin_user_path(user)) unless user.image.nil?
  end
#actions :all, except: [:update, :destroy]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
    index do
    column :name
    column :email
    column :dob
    column :created_at
    column :updated_at
    actions
    end


    filter :name
    filter :email
    filter :dob
    filter :created_at
    filter :updated_at
sidebar :help do
  "Need help? Email us at help@example.com"
end

end
