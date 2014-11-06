class Player

end

class CreateScert
    attr_reader :scert_color
    def initialize
        @scert_color = []
        4.times do
            @scert_color.push(color[rand(7)])
        end
        return @scert_color
    end
    
    def color
        all_color = ["red","green","yellow","blue","white","black","grey","gold"]
    end
end

class ScertArray
    attr_reader :scert_code
    def initialize(enter_guss = CreateScert.new.scert_color)
        @scert_code = enter_guss
    end   
end

class Game
    attr_reader :code,:correct,:have
    def initialize(code)
        @code = code    
    end
    
    def check(guss)
        arr_guss = guss.split
        @correct = 0
        @have = 0
        wrong_arr = @code
        wrong_input = arr_guss   
        @code.each_index do |i|
            if @code[i] == arr_guss[i]
                @correct += 1
                wrong_arr[i] = "-"
            else
                wrong_input[i] = "-"
            end
        end
        wrong_input.each do |y|
        
           if wrong_arr.include?(y)
                @have += 1 
            end
        end
    end

    def play
        
    end
end

x = ScertArray.new
p x.scert_code
y = Game.new(x.scert_code)
y.check(gets.chomp)
puts y.correct,y.have
