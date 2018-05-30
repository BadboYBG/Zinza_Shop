ActiveAdmin.register User do
  permit_params :name, :phone, :address, :avatar, :email

  index do
    column :name
    column :email
    column :phone
    column :address
    actions
  end

  show do
    panel "User Details" do
      attributes_table_for user do
        row "Avatar" do |post|
          image_tag post.avatar_url, alt: "Avatar"
        end
        row :name
        row :phone
        row :address
        row :email
        row :created_at
      end
    end
  end
end
