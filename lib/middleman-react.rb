require "middleman-core"

::Middleman::Extensions.register(:react) do
  require "middleman-react/extension"
  ::Middleman::ReactExtension
end
