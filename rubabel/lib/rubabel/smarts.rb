require 'openbabel'

module Rubabel
  class Smarts
    
    attr_accessor :ob

    def initialize(string)
      @string = string
      @ob = OpenBabel::OBSmartsPattern.new
      unless @ob.init(string)
        raise ArgumentError, "#{string} not a valid SMARTS string"
      end
    end

    def to_s
      # would like to do the above, but just getting this:
      # #<SWIG::TYPE_p_std__string:0x000000022ecd70
      # @obsmarts.get_smarts.to_s
      @string
    end

    def inspect
      "<Rubabel::Smarts #{to_s}>"
    end
  end
end
