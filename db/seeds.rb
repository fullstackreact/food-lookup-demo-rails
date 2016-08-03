#!/usr/bin/env ruby

require 'csv'

COLUMNS = [
  'ndb_no',
  'description',
  'water_g',
  'kcal',
  'protein_g',
  'lipid_total_g',
  'ash_g',
  'carbohydrate_g',
  'fiber_td_g',
  'sugar_g',
  'calcium_mg',
  'iron_mg',
  'magnesium_mg',
  'phosphorus_mg',
  'potassium_mg',
  'sodium_mg',
  'zinc_mg',
  'copper_mg',
  'manganese_mg',
  'selenium_ug',
  'vit_c_mg',
  'thiamin_mg',
  'riboflavin_mg',
  'niacin_mg',
  'panto_acid_mg',
  'vit_b6_mg',
  'folate_tot_ug',
  'folic_acid_ug',
  'food_folate_ug',
  'folate_dfe_ug',
  'choline_tot_mg',
  'vit_b12_ug',
  'vit_a_iu',
  'vit_a_rae',
  'retinol_ug',
  'alpha_carot_ug',
  'beta_carot_ug',
  'beta_crypt_ug',
  'lycopene_ug',
  'lut_and_zea_ug',
  'vit_e_mg',
  'vit_d_ug',
  'vit_d_iu',
  'vit_k_ug',
  'fa_sat_g',
  'fa_mono_g',
  'fa_poly_g',
  'cholestrl_mg',
  'gmwt_1',
  'gmwt_desc1',
  'gmwt_2',
  'gmwt_desc2',
  'refuse_pct',
]

print "\nSeeding..."

dir = File.dirname(File.expand_path(__FILE__))
lineno = 1
CSV.foreach(File.join(dir, 'raw-ndb.csv'), 'r:ISO8859-1') do |row|
  lineno = $.

  next if lineno == 1
  print '.' if lineno % 1000 == 0

  # Humanize descriptions
  row[1] = row[1].capitalize.gsub(/([\,\/])\s*/, '\1 ').gsub(/\s*\&\s*/, ' \1 ')

  entry = {}

  COLUMNS.each_with_index do |column, idx|
    entry[column] = row[idx]
  end

  Food.create!(entry)
end

print "done."
print "\n#{lineno} food entries imported."
