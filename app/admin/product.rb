ActiveAdmin.register Product do
  permit_params :name, :description, :price, comments_attributes: [:id, :text, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    actions
  end

  filter :name
  filter :price
  filter :description
  filter :created_at

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :price
      f.input :description
      f.has_many :comments, allow_destroy: true do |cf|
        cf.input :text
      end
    end
    f.actions
  end

  show do |product|

    attributes_table do
      row :name
      row :price
      row :description
    end

    product.comments.each do |comment|
      panel "Comment" do
        comment.text
      end
    end
  end

end
