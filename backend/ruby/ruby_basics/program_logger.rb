## wtf is this supposed to be? isn't this supposed to be a 
## method where you recursively call the block if a sub-block 
## is identified? 

#anyway this is the solution:

def log block_description, &block
puts 'Beginning "'+block_description+'" . . .'
value_returned = block.call
puts '. . . "'+block_description+'" finished, returning:'
puts value_returned
end

log 'outer block' do

log 'some little block' do
5
end

log 'yet another block' do
'I like Thai food!'
end

false
end


## better logger

$nesting_depth = 0
$space = ' '

def log block_description, &block
    puts $space*$nesting_depth + 'Beginning "'+block_description+'" ...'
    $nesting_depth = $nesting_depth + 1
    value_returned = block.call
    $nesting_depth = $nesting_depth - 1
    puts $space*$nesting_depth + '... "'+block_description+'" finished, returning:'
    puts $space*$nesting_depth + value_returned.to_s
end

log 'outer block' do

log 'some little block' do

log 'teeny-tiny block' do
'lots of love'
end

42
end

log 'yet another block' do
'I love Indian food!'
end

true
end