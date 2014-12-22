ActiveAdmin.register Comment do
  permit_params :text

  index do
    selectable_column
    id_column
    column :text
    column :product do |comment|
      comment.product.name
    end
    actions
  end

  filter :text
  filter :created_at

  form do |f|
    f.inputs "Comment Details" do
      f.input :text
    end
    f.actions
  end

end
