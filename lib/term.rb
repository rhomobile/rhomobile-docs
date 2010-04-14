# author: Vincent Landgraf <setcool@gmx.de>
# licence: GPLv2.1
require "rubygems"
require "coderay"

module CodeRay
  module Scanners
    class Term < Scanner
      include CodeRay::Streamable
      register_for :term

      def scan_tokens (tokens, options)
        state = :initial
        output = ""

        until eos?
          if state == :initial
            if match = scan(/\$/)
              tokens << [match, :prompt]
            else
              tokens << [scan(/.*\n/), :command]
              state = :output
            end
          else
            output << getch
          end
        end
        tokens << [output, :output]

        return tokens
      end
    end
  end
end