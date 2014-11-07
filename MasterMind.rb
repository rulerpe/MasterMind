class Player

end

class CreateScert
    attr_reader :scert_color, :all_color
    def initialize
        @scert_color = []
        4.times do
            @scert_color.push(color[rand(7)])
        end
        return @scert_color
    end
    
    def color
        @all_color = ["red","green","yellow","blue","white","black","grey","gold"]
    end
end

class ScertArray
    attr_reader :scert_code
    def initialize(enter_guss = CreateScert.new.scert_color)
        @scert_code = enter_guss
    end   
end

class AiGuss
    def initialize
        ai_check
        @last_correct = 0
        @last_have = 0
    end
    
    def ai_check (correct = 0, have = 0)
        @correct = correct
        @have = have
    
        if (correct == 0 && have == 0)
            @ai_guss = new_guss
        else if (@correct != 0)
            
            
        end
    end
    
    def new_guss
        available = CreateScert.new.all_color
        guss = []
        4.times do
            guss.push(available[rand(7)])
        end
        return guss
    end
    
    def get_guss
        @ai_guss.join(" ")
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
z = AiGuss.new
y.check(z.get_guss)
puts y.correct,y.have
