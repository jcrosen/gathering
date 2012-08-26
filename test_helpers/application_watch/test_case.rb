# -*- coding: UTF-8 -*-

module ApplicationWatch
  
  def db
    Application.instance.config.backend
  end

  class MiniTest::Spec
  
    def db
      Application.instance.config.backend
    end
  
    def run( *args, &block )
      value = nil
   
      begin
        db.transaction do
          value = super
          raise RubyPersistenceAPI::Rollback
        end
      rescue RubyPersistenceAPI::Rollback
      end
   
      return value  # The result of run must be always returned for the pretty dots to show up
    end
   
  end

end
