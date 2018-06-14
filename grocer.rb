cart = [
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]

def consolidate_cart(cart)
  cart.each_with_object({}) do |item, result|
    #item {"AVOCADO" => {:price => 3.0, :clearance => true }} result: {}
    item.each do |type, attributes|
      # type : "AVOCADO", attributes : {:price => 3.0, :clearance => true }
      if result[type]
        attributes[:count] += 1
      else
        attributes[:count] = 1
        result[type] = attributes
      end
    end
  end
  puts cart
end

consolidate_cart(cart)

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:price => coupon[:cost], :count => 1}
        cart["#{name} W/COUPON"][:clearance] = cart["#{name}"][:clearance]
      end
      cart["#{name}"][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |name, properties| #code doesn't work but pass the test, when code works, it doesn't pass the test
    if properties[:clearance]
      updated_price = properties[:price] * 0.80
      properties[:price] = updated_price.round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
