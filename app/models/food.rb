class Food < ActiveRecord::Base
  def fat_g
    (
      fa_sat_g.to_f + fa_mono_g.to_f + fa_poly_g.to_f
    ).round(2)
  end

  JSON_KEYS = %w{description kcal fat_g carbohydrate_g protein_g}
  def as_json(opts = {})
    super.tap do |e|
      e['fat_g'] = fat_g
    end.slice(*JSON_KEYS)
  end
end
