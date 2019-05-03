module ModelScopes::IdeaScope
  extend ActiveSupport::Concern

  included do
    send(:include, Module.const_get('ModelScopes::SharedScope'))
  end
end
