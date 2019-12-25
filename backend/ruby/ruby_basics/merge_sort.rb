# doesn't work. no time, just skipped it


def merge(left_arr, right_arr)
    if right_arr.empty?
        left_arr
    elsif left_arr.empty?
        right_arr
    else 
        left_head = left_arr[0]
        right_head = right_arr[0]
        if left_head <= right_head
            merge(left_arr[1, -1], right_arr).unshift(left_head)
        else 
            merge(left_arr, right_arr[1, -1]).unshift(right_head)
        end
    end
    def merge_sort(arr)
        if(arr.empty? || arr.length == 1)
            return arr
        else 
            middle_index = arr.length / 2 - 1 #rounded down
            left_arr = merge_sort(arr[0..middle_index])
            right_arr = merge_sort(arr[middle_index..-1])
            merge(left_arr, right_arr)
        end
    end
end
