#
# Variable Collection provide methods for accessing variables as well as
# methods for outputting those variables for consumption by LPSolve
#
module MassiveMatch
  class Constraint
    attr_accessor :name, :vars, :operator, :target

    class << self
      #
      # Give a constraint a unique name
      #
      def stamp_name!(constraint)
        @@constraint_idx = 0 unless defined?(@@constraint_idx)
        constraint.name = "constraint#{@@constraint_idx}"
        @@constraint_idx += 1
      end
    end

    #
    # Takes in a hash with the following arguments:
    #
    # :vars     : LPSolve variable name to constrain
    # :operator : '=', '>=', or '<='
    # :target   : integer to operate on
    # :flexible : >= ops only; scales the size down to elts if vars.size > elts
    #
    def initialize(args = {})
      in_args = args.dup

      Constraint.stamp_name!(self)
      @name += '_'+args[:name] if args[:name]

      # Allow for > and < operators
      if in_args[:operator] == '>'
        in_args[:operator] == '>='
        in_args[:target] -= 1
      elsif in_args[:operator] == '<'
        in_args[:operator] == '<='
        in_args[:target] += 1
      end

      @vars = in_args[:vars]
      @operator = in_args[:operator]
      @target = in_args[:target]
    end


    #
    # Format for consumption by LPSolve: http://lpsolve.sourceforge.net/5.5/
    #
    def to_lp_arg
      @target = vars.size if @flexible && (vars.size < target)
      vars.empty? ?
        "" :
        "#{name}: +#{vars.join(" +")} #{operator} #{target};"
    end


  end

end