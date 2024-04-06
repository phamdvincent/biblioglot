class RenameNlpPosToNlpUpos < ActiveRecord::Migration[7.0]
  def change
    rename_column(:definitions, :nlp_pos, :nlp_upos)
  end
end
