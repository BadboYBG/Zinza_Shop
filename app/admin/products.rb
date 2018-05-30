ActiveAdmin.register Product do
  permit_params :name, :price, :sale, :number, :detail, :image, :category_id

  index do
    column :name
    column :price
    column :sale
    column :number
    column :image
    column 'Category' do |product|
      product.category.present? ? product.category.name : content_tag(:span, "no category yet")
    end
    actions
  end

  show do
    panel "User Details" do
      attributes_table_for product do
        row "Avatar" do |post|
          image_tag post.image_url, alt: "Image", style: "height=42; width=42"
        end
        row :name
        row :price
        row :sale
        row :number
        row :category
        row :created_at
        row :detail
      end
    end
    active_admin_comments
  end

  filter :name
  filter :category, label: 'Category', as: :select,
  collection: proc { Category.distinct.pluck :name, :id }

  # form html: { multipart: true } do |f|
  # end
end
