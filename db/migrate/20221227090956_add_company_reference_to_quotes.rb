class AddCompanyReferenceToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :quotes, :company, null: true, foreign_key: true, type: :uuid
  end
end
