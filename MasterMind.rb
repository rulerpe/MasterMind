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
        @temp = ""
        @temp_i = 0
        @answer = Array.new(4)
    end
    
    def ai_check (correct = 0, have = 0)
        @correct = correct
        @have = have
        
        if @correct == 4
            return @answer
        end
        
        if (correct == 0 && have == 0)
            @ai_guss = new_guss
        else 
            if @correct > @last_correct
                if ( @correct >0 && @temp == "")
                    @ai_guss[@temp_i] = "-"
                    @temp = @ai_guss[@temp_i]
                    @correct = @last_correct
                elsif @correct == @last_correct
                    @ai_guss[@temp_i] = @temp
                    @temp_i += 1
                    @ai_guss[@temp_i] = "-"
                    @temp = @ai_guss[@temp_i]
                    @correct = @last_correct
                elsif @correct != @last_correct
                    @answer = @ai_guss[@temp_i]  
                end
            end
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
        wrong_arr = @code.dup
        wrong_input = arr_guss.dup   
        @code.each_index do |i|
            if @code[i] == arr_guss[i]
                @correct += 1
                wrong_arr[i] = "-"
                wrong_input[i] = "+"
            end
        end
        wrong_input.each do |y| 
            wrong_arr.each_index do |x|
                if wrong_arr[x] == y
                    @have += 1 
                    wrong_arr[x] = "-"
                    break
                end
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
while true
    p y.code
    puts z.get_guss
    y.check(z.get_guss)
    puts y.correct,y.have
    z.ai_check
    break if gets.chomp=="q"
end
