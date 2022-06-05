# alias the module
# alias Foo.Bar, as: Bar <=> alias Foo.Bar
#
# import functions from Foo so they can be called without the 'Foo' prefix
# import Foo
#
# require the module in order to use its macros
# require Foo
#
# Invokes the custom code defined in Foo as an extension point
# use Foo

defmodule Stats do
  alias Math.List, as: List
  # In the remaining module definition, List -> Math.List
  # Reference the original "List" as Elixir.List
end

