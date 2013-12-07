class Calculation < ActiveRecord::Base
    before_save :calculate

    def calculate
        self.operation = self.a + self.b
    end
end
