MATCHED_PAIR = '()'

def recursive_match_it(string)
  if string.empty?
    return true
  else
    return false if !string.include?(MATCHED_PAIR)|| string.size.odd?
  end
  recursive_match_it string.tr(MATCHED_PAIR, "")
end


def match_it(string)
  stack = []
  string.chars.each do |char|
    if char == MATCHED_PAIR[0] 
      stack.push char
    else
      return false if stack.empty?
      stack.pop
    end
  end
  stack.empty?
end

puts "Recursive test"
puts recursive_match_it("(") == false
puts recursive_match_it("((") == false
puts recursive_match_it("(()") == false

puts recursive_match_it("()") == true
puts recursive_match_it("()()") == true
puts recursive_match_it("(()())") == true
puts
puts "Non recursive test"
puts match_it("(") == false
puts match_it("((") == false

puts match_it("()") == true
puts match_it("()()") == true
puts match_it("(()())") == true
