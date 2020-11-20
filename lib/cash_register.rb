class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize discount = 0
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = 0
    end

    def add_item (title, price, quantity = 1)
        self.items.concat(Array.new(quantity, title))
        self.total += price * quantity
        self.last_transaction = price * quantity
    end

    def apply_discount
        result_message = ""
        self.total = self.total - (self.total * discount/100)
            if @discount == 0
                result_message = "There is no discount to apply."
            else
                result_message = "After the discount, the total comes to $#{self.total}."
            end
        result_message
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end