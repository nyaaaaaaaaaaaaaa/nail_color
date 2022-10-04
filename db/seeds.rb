# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  #first_name: '管理者',
  #last_name: '太郎',
  #first_name_kana: 'カンリシャ',
  #last_name_kana: 'タロウ',
  email: 'admin@1',
  password: 'adminpw',
  #password_confirmation: 'admin',
  #state_id: 45,
  #phone_number: '09012345678',
  #birth_day: '2000-01-01',
  #admin: true
)

Tag.create([
  { name: 'ネイルケア' },
  { name: 'ポリッシュ（マニキュア）' },
  { name: 'ジェルネイル' },
  { name: 'ネイルシール' },
  { name: 'ネイルチップ' },
  { name: 'スカルプチュア' },
  { name: 'その他' }
])