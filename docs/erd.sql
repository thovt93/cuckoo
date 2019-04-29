Table option_types {
  id int [primary key]
  name varchar
  created_at varchar
  updated_at varchar
}

Table option_values {
  id int [primary key]
  option_type_id int [ref: > option_types.id]
  name varchar
  created_at varchar
  updated_at varchar
}


Table products {
  id int [pk]
  brand_id int [ref: > brands.id]
  category_id int [ref: > categories.id]
  name varchar
  description varchar
  available_on varchar
  created_at varchar
  updated_at varchar
}

Table variants {
  id int [pk]
  product_id int [ref: > products.id]
  name varchar
  color_code varchar
  cost varchar
  price varchar
  position int
  created_at varchar
  updated_at varchar
}

Table option_value_vagraints {
  id int [primary key]
  variant_id int [ref: > variants.id]
  option_value_id int [ref: > option_values.id]
  created_at varchar
  updated_at varchar
}

Table line_items {
  id int [pk]
  order_id int [ref: > orders.id]
  variant_id int [ref: > variants.id]
  quantity int
  price int
  cost int
  created_at varchar
  updated_at varchar
}

Table orders {
  id int [pk]
  number varchar
  user_id int [ref: > users.id]
  completed_at varchar
  adjustment_total int
  item_total int
  total int
  ship_address_id int [ref: > addresses.id]
  created_at varchar
  updated_at varchar
}

Table adjustments {
  id int [pk]
  order_id int [ref: > orders.id]
  label varchar
  amount int
  created_at varchar
  updated_at varchar
}

Table brands {
  id int [pk]
  name varchar
  created_at varchar
  updated_at varchar
}

Table categories {
  id int [pk]
  name varchar
  created_at varchar
  updated_at varchar
}


Table addresses {
  id int [pk]
  user_id int [ref: > users.id]
  address varchar
  first_name varchar
  last_name varchar
  phone varchar
  district_id int  [ref: > districts.id]
  province_id int [ref: > provinces.id]
  created_at varchar
  updated_at varchar
}

Table provinces {
  id int [pk]
  name varchar
}

Table districts {
  id int [pk]
  name varchar
}

Table wards {
  id int [pk]
  district_id int [ref: > districts.id]
  name varchar
  unit varchar
}

Table users {
  id int [primary key]
  first_name varchar]
  last_name varchar
  email varchar [unique]
  encrypted_password varchar
  gender varchar
  date_of_birth varchar
  created_at varchar
  updated_at varchar
}

Table roles {
  id int [primary key]
  name varchar
}

Table role_users {
  id int [primary key]
  user_id int [ref: > users.id]
  role_id int [ref: > roles.id]
  created_at varchar
  updated_at varchar
}

