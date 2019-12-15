def clock input_proc
    ## iterations:
    current_hour = Time.new.hour 
    if current_hour == 0
        current_hour = 12
    elsif
        current_hour > 12
        current_hour = current_hour - 12
    end 

    ## call input proc for the number of iterations
    current_hour.to_i.times do
        # call the proc
        input_proc.call 
    end
end

# Dong proc
dong_proc = Proc.new do
    puts 'DONG!'
    end

    
clock dong_proc
