ActiveAdmin.register Topic do
  permit_params :title, :icon

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :icon, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :icon do |i|
        image_tag url_for(i.icon)
      end
    end
  end
end
