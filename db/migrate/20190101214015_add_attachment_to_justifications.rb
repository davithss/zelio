class AddAttachmentToJustifications < ActiveRecord::Migration[5.2]
  def change
    add_attachment :justifications, :upload
  end
end
