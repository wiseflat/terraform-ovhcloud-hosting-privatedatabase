data "ovh_order_cart" "database" {
  ovh_subsidiary = var.subsidiary
  description    = var.description
}

data "ovh_order_cart_product_plan" "database" {
  cart_id        = data.ovh_order_cart.database.id
  price_capacity = var.price_capacity
  product        = var.product
  plan_code      = var.plan_code
}

resource "ovh_hosting_privatedatabase" "instance" {
  ovh_subsidiary = data.ovh_order_cart.database.ovh_subsidiary
  display_name   = var.name

  plan {
    duration     = data.ovh_order_cart_product_plan.database.prices[3].duration
    plan_code    = data.ovh_order_cart_product_plan.database.plan_code
    pricing_mode = data.ovh_order_cart_product_plan.database.selected_price[0].pricing_mode

    configuration {
      label = "TECH_ACCOUNT"
      value = var.tech_account
    }

    configuration {
      label = "dc"
      value = var.datacenter
    }

    configuration {
      label = "engine"
      value = var.engine
    }
  }
}
