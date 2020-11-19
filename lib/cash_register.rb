class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        self.total= 0
        
        @discount = discount
        @cart = []
    end
    
    def add_item(item, price, quantity = 1)
        item_info = {}
        item_info[:name] = item
        item_info[:price] = price
        item_info[:quantity] = quantity

        @cart << item_info
        @total += price * quantity
    end

    def apply_discount
        # binding.pry
        if self.discount >0
          self.total -= ((self.discount/100.0)*self.total)
          success_message = "After the discount, the total comes to $#{self.total.to_i}."
          return success_message
        else
          failure_message = "There is no discount to apply."
          return failure_message
        end
      end
    def items
        item_names = []
        @cart.each do |item_info|
            for qty in 1..item_info[:quantity]
                item_names << item_info[:name]
            end
        end
        item_names
    end
    def void_last_transaction
        @total -= @price
        total
    end
end
