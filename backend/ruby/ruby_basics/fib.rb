
# iterative:
def fibs_i(n)
    res = [0, 1]
    2.upto(n) do |i|
        res.push(res[-2] + res[-1])
    end
    res
end
# recursive:
def fibs_r(n, result = [0, 1])
    return result if n < 2
    result << result[-1] + result[-2]
    fibs_r(n - 1, result)
end