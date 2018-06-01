ActiveAdmin.register Product do
  permit_params :name, :price, :sale, :number, :detail, :image, :category_id, :user_id

  index do
    column :name
    column 'User' do |product|
      product.user.present? ? product.user.name : content_tag(:span, 'no user yet')
    end
    column :price
    column :sale
    column :number
    column :image
    column 'Category' do |product|
      product.category.present? ? product.category.name : content_tag(:span, 'no category yet')
    end
    actions
  end

  show do
    panel 'User Details' do
      attributes_table_for product do
        row 'Avatar' do |post|
          image_tag post.image_url, alt: 'Image'
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

  csv do
    column :name
    column :price
    column :sale
    column 'Gia' do |p|
      price_product(p)
    end
  end

  filter :name
  filter :category, label: 'Category', as: :select, collection: proc { Category.distinct.pluck :name, :id }
end
