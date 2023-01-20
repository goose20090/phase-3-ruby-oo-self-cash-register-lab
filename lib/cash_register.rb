require "pry"
class CashRegister
    attr_accessor :discount, :total, :items, :transaction

    def initialize (discount = nil)
        @discount = discount
        @total = 0
        @items = []
        @transaction = []
    end

    def add_item title, price, quantity= 1
        self.total += (price * quantity)
        quantity.times do
            self.items << title
        end
        self.transaction<< {
            title: title,
            price: price,
            quantity: quantity 
        }
    end

    def apply_discount
        if !discount
            return "There is no discount to apply."
        end
        self.total = self.total * (1-discount.to_f/100)
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        self.transaction.last[:quantity].times do 
            self.total-= self.transaction.last[:price]
            self.items.delete_at(-1)
        end
        self.transaction.delete_at(-1)
    end

end

# binding.pry()