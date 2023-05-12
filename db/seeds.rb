# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Додавання 30 продуктів

# products = [
#   { name: "Каструля з кришкою 'Майстерня Смаку'",
#     description: 'Ця каструля з нержавіючої сталі має велику місткість і дуже зручна для приготування різних страв.',
#     price: 549.99,
#     quantity: 10 },
#   { name: "Сковорода 'Політ'",
#     description: 'Ця сковорода з антипригарним покриттям і зручною ручкою стане незамінною річчю в вашій кухні.',
#     price: 229.99,
#     quantity: 20 },
#   { name: "Ніж для нарізання 'Кулінар'",
#     description: 'Цей ніж зі сталі високої якості дозволяє легко і швидко нарізати різноманітні продукти.',
#     price: 79.99,
#     quantity: 30 },
#   { name: "Кавоварка 'Чарівна крапля'",
#     description: 'Ця кавоварка з нержавіючої сталі забезпечує швидке і зручне приготування смачної кави.',
#     price: 369.99,
#     quantity: 5 },
#   { name: "Сито 'Смачний відбір'",
#     description: 'Це сито з міцної сталі дозволяє легко відокремити відходи від їжі й зберегти цінність продуктів.',
#     price: 84.99,
#     quantity: 50 },
#
#   { name: "Кухонний комбайн 'Майстер Кухар'",
#     description: 'Цей комбайн дозволяє швидко і легко нарізати, натерти й змішати різні продукти.',
#     price: 799.99,
#     quantity: 20 },
#   { name: "Набір кухонних інструментів 'Мій Кухар'",
#     description: 'Цей набір містить ножі, ложки, вилки й інші корисні інструменти для приготування їжі.',
#     price: 129.99,
#     quantity: 100 },
#   { name: "Плита електрична 'Гаряча точка'",
#     description: 'Ця плита забезпечує швидке і рівномірне нагрівання ідеальне для приготування різноманітних страв.',
#     price: 84.99,
#     quantity: 50 },
#   { name: "Форма для запікання 'Смакота'",
#     description: 'Ця форма з нержавіючої сталі дозволяє приготувати різні запіканки й десерти.',
#     price: 25.99,
#     quantity: 200 },
#   { name: "Блендер 'Кухонний маг'",
#     description: 'Цей блендер дозволяє швидко і легко змішувати й розмелювати різні продукти.',
#     price: 139.99,
#     quantity: 30 },
#
#   { name: "Чайник електричний 'Чайна казка'",
#     description: 'Цей чайник забезпечує швидке і зручне приготування гарячого чаю або кави.',
#     price: 119.99,
#     quantity: 15 },
#   { name: "Терка 'Смачна ідея'",
#     description: 'Ця терка забезпечує легке і швидке нарізання і натирання різних продуктів.',
#     price: 49.99,
#     quantity: 65 },
#   { name: "Сковорода-гриль 'Смаковий куток'",
#     description: 'Ця сковорода забезпечує швидке і рівномірне нагрівання для приготування стейків, риби й овочів.',
#     price: 219.99,
#     quantity: 30 },
#   { name: "Мультиварка 'Мультикухар'",
#     description: 'Ця мультиварка дозволяє готувати різні страви на пару, тушкувати, смажити й т.д.',
#     price: 799.99,
#     quantity: 10 },
#   { name: "Набір ножів 'Майстерність'",
#     description: 'Цей набір містить різноманітні ножі для нарізання м\'яса, риби, овочів і фруктів.',
#     price: 99.99,
#     quantity: 15 },
#
#   { name: "Келихи для вина 'Винна галявина'",
#     description: 'Ці келихи забезпечують правильну подачу і зберігання вина, зберігаючи його аромат і смак.',
#     price: 69.99,
#     quantity: 50 },
#   { name: "Форма для випічки 'Солодкий дім'",
#     description: 'Ця форма забезпечує рівномірне пекарство ідеальне для приготування різних видів хліба і пирогів.',
#     price: 29.99,
#     quantity: 80 },
#   { name: "Кухонний таймер 'Час приготування'",
#     description: 'Цей таймер дозволяє точно відстежувати час приготування їжі та запобігає її перепіканню.',
#     price: 149.99,
#     quantity: 20 },
#   { name: "Набір мисок 'Миска смаку'",
#     description: 'Цей набір містить різноманітні миски для зберігання продуктів і приготування різних страв.',
#     price: 109.99,
#     quantity: 30 },
#   { name: "Каструля-скороварка 'Скоринка'",
#     description: 'Ця каструля-скороварка забезпечує швидке приготування страв,зберігаючи їхній смак.',
#     price: 359.99,
#     quantity: 5 }
#
#   { name: "Келихи для шампанського 'Вишуканість'",
#     description: 'Ці келихи створені спеціально для правильної подачі та насолоди від шампанського.',
#     price: 89.99,
#     quantity: 40 },
#   { name: "Ніж для нарізання сиру 'Сирний майстер'",
#     description: 'Цей ніж дозволяє нарізати сир на тонкі та рівні шматочки, зберігаючи його текстуру та смак.',
#     price: 49.99,
#     quantity: 60 },
#   { name: "Сковорідка з антипригарним покриттям 'EasyCook'",
#     description: 'Ця сковорідка дозволяє готувати їжу без жиру та запобігає пригоранню, зберігаючи смак.',
#     price: 79.99,
#     quantity: 25 },
#   { name: "Набір ножів для кухні 'ProChef'",
#     description: 'Цей набір містить ножі для нарізання та очищення різноманітних продуктів',
#     price: 179.99,
#     quantity: 15 },
#   { name: "Кавоварка 'Моя мрія'",
#     description: 'Ця кавоварка забезпечує приготування смачної та ароматної кави в будь-який момент.',
#     price: 249.99,
#     quantity: 10 },
#
#   { name: "Набір форм для запікання 'Кулінарна фантазія'",
#     description: 'Цей набір містить форми різних розмірів та форм для запікання різноманітних страв.',
#     price: 99.99,
#     quantity: 20 },
#   { name: "Набір кухонних інструментів 'Елегантність'",
#     description: 'Цей набір кухонних інструментів виготовлений з високоякісної сталі та має приємний дизайн.',
#     price: 129.99,
#     quantity: 35 },
#   { name: "Мультиварка 'Помічник'",
#     description: 'Ця мультиварка має різні режими приготування, що дозволяє зекономити час та експерементувати.',
#     price: 799.99,
#     quantity: 10 },
#   { name: "Набір кухонних інструментів 'Все для дому'",
#     description: 'Цей набір містить абсолютно все для абсолютно всіх видів задач в кулінарному мистецтві.',
#     price: 349.99,
#     quantity: 15 },
#   { name: "Форма для запікання 'Твоє - все!'",
#     description: 'Ця форма ідеальна для запікання різних видів страв, зберігаючи їхній аромат і смак.',
#     price: 39.99,
#     quantity: 35 }
# ]
#
# products.each do |product_data|
#   Product.create(product_data)
# end

# Додавання 5 знижок

# 5.times do
#   Discount.create(
#     product_id: rand(1..10),
#     percent: rand(5..30),
#     start_date: Faker::Date.between(from: 6.months.ago.to_s, to: Date.today),
#     end_date: Faker::Date.between(from: Date.tomorrow, to: 6.months.from_now.to_s)
#   )
# end

# Додавання категорій та підкатегорій

=begin
# Посуд
posud = Category.create(name: "Посуд", parent_id: nil, description: "Все необхідне для приготування їжі")
  # Каструлі
  kastulya = Category.create(name: "Каструлі", parent_id: posud.id, description: "Для звичайного приготування їжі")
  # Каструлі скороварки
  skorovarka = Category.create(name: "Каструлі скороварки", parent_id: posud.id, description: "Для швидкого приготування їжі")
  # Сковороди
  skovorda = Category.create(name: "Сковороди", parent_id: posud.id, description: "Для смаження їжі на різній основі")
  # Ножі
  nozh = Category.create(name: "Ножі", parent_id: posud.id, description: "Для різання продуктів")

# Для чаю та кави
chay_kava = Category.create(name: "Для чаю та кави", parent_id: nil, description: "Все необхідне для приготування чаю та кави")
  # Кавоварки
  kavovarka = Category.create(name: "Кавоварки", parent_id: chay_kava.id, description: "Для приготування кави")
  # Чайники
  chaynyk = Category.create(name: "Чайники", parent_id: chay_kava.id, description: "Для приготування чаю")

# Кухонне приладдя
priladdya = Category.create(name: "Кухонне приладдя", parent_id: nil, description: "Інструменти для приготування їжі")
  # Сита
  sita = Category.create(name: "Сита", parent_id: priladdya.id, description: "Для просіювання муки та інших сипучих продуктів")
  # Набори інструментів
  nabir = Category.create(name: "Набори інструментів", parent_id: priladdya.id, description: "Комплекти інструментів для різних видів робіт")
  # Терки
  terka = Category.create(name: "Терки", parent_id: priladdya.id, description: "Для тертя продуктів")
  # Миски
  miska = Category.create(name: "Миски", parent_id: priladdya.id, description: "Для зберігання та змішування інгредієнтів")

# Побутова техніка
tehnika = Category.create(name: "Побутова техніка", parent_id: nil, description: "Електронні пристрої для приготування їжі")
  # Кухонні комбайни
  kombayn = Category.create(name: "Кухонні комбайни", parent_id: tehnika.id, description: "Для змішування, різання та перемішування інгредієнтів")
  # Плити
  plyta = Category.create(name: "Плити", parent_id: tehnika.id, description: "Для приготування їжі на вогні")
  # Блендери
  blender = Category.create(name: "Блендери", parent_id: tehnika.id, description: "Для змішування та подрібнення інгредієнтів")
  # Мультиварки
  mulvarka = Category.create(name: "Мультиварки", parent_id: tehnika.id, description: "Для приготування їжі в автоматичному режимі")
  # Кухонні таймери
  taymer = Category.create(name: "Кухонні таймери", parent_id: tehnika.id, description: "Для вимірювання часу приготування їжі")

# Аксесуари для кухні
aksesuary = Category.create(name: "Аксесуари для кухні", parent_id: nil, description: "Різні аксесуари для приготування їжі")
  # Форми для запікання і випічки
  forma = Category.create(name: "Форми для запікання і випічки", parent_id: aksesuary.id, description: "Для приготування випічки та запікання страв")

# Келихи і фужери
kelih = Category.create(name: "Келихи і фужери", parent_id: nil, description: "Різні види склянок для напоїв")
=end

# Додавання в categories_products

=begin
data = [
  { category_id: 2, product_id: 1 },
  { category_id: 3, product_id: 20 },
  { category_id: 4, product_id: 2 },
  { category_id: 4, product_id: 13 },
  { category_id: 4, product_id: 23 },
  { category_id: 5, product_id: 3 },
  { category_id: 5, product_id: 15 },
  { category_id: 5, product_id: 22 },
  { category_id: 5, product_id: 24 },
  { category_id: 7, product_id: 4 },
  { category_id: 7, product_id: 25 },
  { category_id: 8, product_id: 11 },
  { category_id: 10, product_id: 5 },
  { category_id: 11, product_id: 7 },
  { category_id: 11, product_id: 27 },
  { category_id: 11, product_id: 29 },
  { category_id: 12, product_id: 12 },
  { category_id: 13, product_id: 19 },
  { category_id: 15, product_id: 6 },
  { category_id: 16, product_id: 8 },
  { category_id: 17, product_id: 10 },
  { category_id: 18, product_id: 14 },
  { category_id: 18, product_id: 28 },
  { category_id: 19, product_id: 18 },
  { category_id: 21, product_id: 9 },
  { category_id: 21, product_id: 17 },
  { category_id: 21, product_id: 30 },
  { category_id: 21, product_id: 26 },
  { category_id: 22, product_id: 16 },
  { category_id: 22, product_id: 21 }
]

data.each do |item|
  category = Category.find(item[:category_id])
  product = Product.find(item[:product_id])
  category.products << product
end
=end

