ActiveAdmin.register Order do
  permit_params :user_id, :total, :status, :date_delivery, :address
end
