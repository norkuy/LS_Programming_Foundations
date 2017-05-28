# Attempt

def block_word?(str)
  
  blocks = [['B', 'O'], ['X', 'K'],
          ['D', "Q"], ['C', 'P'],
          ['N', 'A'], ['G', 'T'],
          ['R', 'E'], ['F', 'S'],
          ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'],
          ['Z', 'M']
          ]
  
  chs = str.split
  chs.each do |char|
    blocks.each do |block|
      if block.include?(char)
        blocks.delete(block) 
      else
        return "Can't spell word!"
      end
    end
  end
  true
end

block_word?('BATCH')

# Answer

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

