# FactoryBot.define do
#   factory :book do
#     sequence(:title) { |n| "title#{n}"}
#     sequence(:body) { |n| "body#{n}"}
#   end
# end

# factorybotの宣言文
FactoryBot.define do
  # どのモデルに対してデータの定義を行うか，の記述
  factory :book do
    # カラム名{}の形式で，指定したカラムにFakerを使ってダミーデータ作成（ランダム５文字）
    title { Faker::Lorem.characters(number:5) }
    # Faker::はfaker使用の宣言
    # Loremはlorem ipsumの略でダミーテキストのタイプを設定している
    # charactersは文字列を生成
    # numberは生成する文字数

    body { Faker::Lorem.characters(number:20) }
  end
end